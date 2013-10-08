//
//  AFVkontakteLoginViewController.m
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 08.10.13.
//
//

#import "AFVkontakteLoginViewController.h"

#import "UIViewController+AFVkontakteClientAdditions.h"

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

- (id)initWithLoginPageURL:(NSURL *)loginPageURL withAuthorizationCallback:(AFVkontakteAuthBlock)authorizationCallback{
    
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

#pragma mark - Autorization

- (void)loadLoginPage{
    
    [self.webView loadRequest:[NSURLRequest requestWithURL: self.loginPageURL]];
}

- (void)webViewDidFinishLoadWithResponseString:(NSString *)webViewResponseString{

    AFVkontakteMethodNotImplemented();
}

#pragma mark - UIWebViewDelegate

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    AFVkontakteMethodNotImplemented();
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSString *webViewResponseString = webView.request.URL.absoluteString;
    [self webViewDidFinishLoadWithResponseString: webViewResponseString];
}

#pragma mark - UI

- (void)addWebView{
    
    self.webView = [[UIWebView alloc] initWithFrame: self.view.bounds];
    self.webView.delegate = self;
    [self.view addSubview: self.webView];
}

- (void)addCloseButton{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Close", @"AFVkontakteLoginViewController close button title")
                                                                             style:UIBarButtonSystemItemCancel
                                                                            target:self action:@selector(close:)];
}

#pragma mark - Actions

- (void)close:(UIBarButtonItem *)button{
    
    AFVkontakteMethodNotImplemented();
}

#pragma mark - Interface

+ (instancetype)showWithLoginPageURL:(NSURL *)loginPageURL
           withAuthorizationCallback:(AFVkontakteAuthBlock)authorizationCallback{
    
    NSParameterAssert(loginPageURL);
    NSParameterAssert(authorizationCallback);
    
    AFVkontakteLoginViewController *vc = [[AFVkontakteLoginViewController alloc] initWithLoginPageURL:loginPageURL withAuthorizationCallback:authorizationCallback];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: vc];
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UIViewController *presenterViewController = [keyWindow.rootViewController topViewController];
    [presenterViewController presentViewController:navigationController animated:YES completion:nil];
    
    return vc;
}

@end
