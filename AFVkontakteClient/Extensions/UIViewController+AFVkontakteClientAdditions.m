//
//  UIViewController+AFVkontakteClientAdditions.m
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 09.10.13.
//
//

#import "UIViewController+AFVkontakteClientAdditions.h"

@implementation UIViewController (AFVkontakteClientAdditions)

- (UIViewController *)topViewController{
    
    if (self.presentedViewController == nil) {
        return self;
    }
    
    if ([self.presentedViewController isMemberOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)self.presentedViewController;
        UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
        return [lastViewController topViewController];
    }
    
    UIViewController *presentedViewController = (UIViewController *)self.presentedViewController;
    return [presentedViewController topViewController];
}

@end
