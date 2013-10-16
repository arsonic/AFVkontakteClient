//
//  ViewController.m
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 16.10.13.
//
//

#import "ViewController.h"

#import "AFVkontakteLoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)loginButtonClicked:(id)sender{
    
    NSString *authLink = [NSString stringWithFormat:@"http://oauth.vk.com/oauth/authorize?client_id=%@&scope=%@&redirect_uri=https://oauth.vk.com/blank.html&display=touch&response_type=token", @"3694721", [@[@"wall"] componentsJoinedByString:@","]];
    NSURL *url = [NSURL URLWithString:authLink];
    
    [AFVkontakteLoginViewController showWithLoginPageURL:url withAuthorizationCallback:^(NSString *authToken, NSString *authorizedUserVkontakteID, NSDate *authTokenExpirationDate, NSError *error) {
        NSLog(@"%@ %@ %@ %@", authToken, authorizedUserVkontakteID, authTokenExpirationDate, error);
    }];
}

@end
