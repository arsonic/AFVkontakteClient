//
//  UIViewController+AFVkontakteClientAdditions.h
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 09.10.13.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (AFVkontakteClientAdditions)

/*! Method to find top visible view controller in other view controllers hierarchy
 \param rootViewController A UIViewController object in which hierarchy we want to get visible view controller
 \return top visible view controller in rootViewController hierarchy
 */
+ (UIViewController *)topViewController:(UIViewController *)rootViewController;

@end
