//
//  UIViewController+AFVkontakteClientAdditions.h
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 09.10.13.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (AFVkontakteClientAdditions)

/*! Method to find top visible view controller in sender view controller hierarchy
 * \return Top visible view controller in sender view controller hierarchy hierarchy
 */
- (UIViewController *)topViewController;

@end
