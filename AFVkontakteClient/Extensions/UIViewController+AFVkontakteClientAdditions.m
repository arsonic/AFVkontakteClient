//
//  UIViewController+AFVkontakteClientAdditions.m
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 09.10.13.
//
//

#import "UIViewController+AFVkontakteClientAdditions.h"

@implementation UIViewController (AFVkontakteClientAdditions)

+ (UIViewController *)topViewController:(UIViewController *)rootViewController{
    
    if (rootViewController.presentedViewController == nil) {
        return rootViewController;
    }
    
    if ([rootViewController.presentedViewController isMemberOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController.presentedViewController;
        UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
        return [self topViewController:lastViewController];
    }
    
    UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
    return [self topViewController:presentedViewController];
}

@end
