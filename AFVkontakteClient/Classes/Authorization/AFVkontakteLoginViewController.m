//
//  AFVkontakteLoginViewController.m
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 08.10.13.
//
//

#import "AFVkontakteLoginViewController.h"

#import "UIViewController+AFVkontakteClientAdditions.h"
#import "NSString+AFVkontakteClientAdditions.h"
#import "NSError+AFVkontakteClient.h"

static NSString *const kVKAutorizeResponseAuthTokenParameterKey = @"access_token";
static NSString *const kVKAutorizeResponseTokenExpirationDateParameterKey = @"expires_in";
static NSString *const kVKAutorizeResponseVkontakteUserIDParameterKey = @"user_id";
static NSString *const kVKAutorizeResponseErrorParameterKey = @"error";

@interface AFVkontakteLoginViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, copy) AFVkontakteAuthBlock authorizationCallback;
@property (nonatomic, strong) NSURL *loginPageURL;

@end

@implementation AFVkontakteLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithLoginPageURL:(NSURL *)loginPageURL withAuthorizationCallback:(AFVkontakteAuthBlock)authorizationCallback
{
    NSParameterAssert(loginPageURL);
    NSParameterAssert(authorizationCallback);
    
    if(self = [super init]){
        self.loginPageURL = loginPageURL;
        self.authorizationCallback = authorizationCallback;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.title = NSLocalizedString(@"Login", @"AFVkontakteLoginViewController title");
    
    [self addCloseButton];
    [self addWebView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helpers

- (NSDate *)authTokenExpirationDateFromUnixTimeString:(NSString *)authTokenExpirationUnixTimeString
{
    if(authTokenExpirationUnixTimeString)
    {
        NSInteger unixTime = authTokenExpirationUnixTimeString.integerValue;
        return [NSDate dateWithTimeIntervalSinceNow: unixTime];
    }
    else
    {
        return nil;
    }
}

#pragma mark - Authorization

- (void)loadLoginPage
{
    [self.webView loadRequest:[NSURLRequest requestWithURL: self.loginPageURL]];
}

- (void)parseWebViewResponseString:(NSString *)webViewResponseString withCompletionCallback:(void (^)(NSString *authToken, NSString *authorizedUserVkontakteID, NSString *authTokenExpirationUnixTimeString, NSError *error))completion
{

    NSParameterAssert(webViewResponseString);
    
    if([webViewResponseString rangeOfString: kVKAutorizeResponseErrorParameterKey].location != NSNotFound)
    {
        AFVKONTAKTE_BLOCK_SAFE_RUN(completion, nil, nil, nil, [NSError AFVK_authenticationError]);
    }
    else
    {
        NSString *authToken = [webViewResponseString stringBetweenSubstring:[NSString stringWithFormat:@"%@=", kVKAutorizeResponseAuthTokenParameterKey]
                                                               andSubstring:@"&"];
        NSString *authTokenExpirationUnixTimeString = [webViewResponseString stringBetweenSubstring:[NSString stringWithFormat:@"%@=", kVKAutorizeResponseTokenExpirationDateParameterKey]
                                                                                       andSubstring:@"&"];
        NSString *vkontakteUserID = [webViewResponseString stringBetweenSubstring:[NSString stringWithFormat:@"%@=", kVKAutorizeResponseVkontakteUserIDParameterKey]
                                                                     andSubstring:@""];
        NSError *error = (!authToken || !authTokenExpirationUnixTimeString || !vkontakteUserID) ? [NSError AFVK_authenticationError] : nil;

        AFVKONTAKTE_BLOCK_SAFE_RUN(completion, authToken, vkontakteUserID, authTokenExpirationUnixTimeString, error);
    }
}

#pragma mark - UIWebViewDelegate

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    AFVkontakteMethodNotImplemented();
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *webViewResponseString = webView.request.URL.absoluteString;
    [self parseWebViewResponseString:webViewResponseString withCompletionCallback:^(NSString *authToken, NSString *authorizedUserVkontakteID, NSString *authTokenExpirationUnixTimeString, NSError *error)
    {
        if(!error)
        {
            AFVKONTAKTE_BLOCK_SAFE_RUN(self.authorizationCallback, authToken, authorizedUserVkontakteID, [self authTokenExpirationDateFromUnixTimeString: authTokenExpirationUnixTimeString], nil);
        }
        else
        {
            //TODO
        }
    }];
}

#pragma mark - UI

- (void)addWebView
{
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView.delegate = self;
    [self.view addSubview: self.webView];
}

- (void)addCloseButton
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Close", @"AFVkontakteLoginViewController close button title")
                                                                             style:UIBarButtonSystemItemCancel
                                                                            target:self
                                                                            action:@selector(close:)];
}

#pragma mark - Actions

- (void)close:(UIBarButtonItem *)button
{
    AFVkontakteMethodNotImplemented();
}

#pragma mark - Interface

+ (instancetype)showWithLoginPageURL:(NSURL *)loginPageURL
           withAuthorizationCallback:(AFVkontakteAuthBlock)authorizationCallback
{
    NSParameterAssert(loginPageURL);
    NSParameterAssert(authorizationCallback);
    
    AFVkontakteLoginViewController *authorizationController = [[AFVkontakteLoginViewController alloc] initWithLoginPageURL:loginPageURL withAuthorizationCallback:authorizationCallback];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: authorizationController];
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UIViewController *presenterViewController = [keyWindow.rootViewController topViewController];
    [presenterViewController presentViewController:navigationController animated:YES completion:nil];
    
    return authorizationController;
}

@end
