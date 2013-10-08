//
//  AFVkontakteLoginViewController.h
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 08.10.13.
//
//

#import <UIKit/UIKit.h>

typedef void(^AFVkontakteAuthBlock)(NSString *authToken, NSString *authorizedUserVkontakteID, NSDate *authTokenExpirationDate, NSError *error);

@interface AFVkontakteLoginViewController : UIViewController

/*
 TODO: Add properties for customizing navigaition bar items, webView and other AFVkontakteLoginViewController view properties
*/

@end
