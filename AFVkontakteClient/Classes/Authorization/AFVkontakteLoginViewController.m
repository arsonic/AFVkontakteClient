//
//  AFVkontakteLoginViewController.m
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 08.10.13.
//
//

#import "AFVkontakteLoginViewController.h"

@interface AFVkontakteLoginViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.title = NSLocalizedString(@"Login", @"AFVkontakteLoginViewController title");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

+ (void)showWithLoginURL:(NSURL *)loginURL withAuthorizationCallback:(AF)

@end
