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

/** 
 * Show UINAvigationController object with AFVkontakteLoginViewController
 * root view controller
 *
 * @param loginPageURL Vkontakte API login page URL
 * @param authorizationCallback A block object to be executed when the authorization 
 * process finishes either successfully or with error. This block has no return value 
 * and takes four arguments: the received auth token, the received authorized user 
 * Vkontakte ID, the recieved auth token expiration date and the `NSError` object 
 * describing the authrization process error that occurred.
 *
 * @return An instance of showing AFVkontakteLoginViewController
 */
+ (instancetype)showWithLoginPageURL:(NSURL *)loginPageURL
                    withAuthorizationCallback:(AFVkontakteAuthBlock)authorizationCallback;

@end
