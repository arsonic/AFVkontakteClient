//
//  NSError+AFVkontakteClient.h
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 10.10.13.
//
//

#import <Foundation/Foundation.h>

// The domain for all errors originating in AFVkontakteClient.
extern NSString * const kAFVkontakteClientErrorDomain;

typedef NS_ENUM(NSInteger, AFVkontakteClientErrorCode)
{
    AFVkontakteClientErrorCodeAuthenticationFailed = 601
};

@interface NSError (AFVkontakteClient)

/**
 * Create NSError object for web view authentication process error
 *
 * @return A NSError object with localized description and localized recovery suggestion
 */
+ (NSError *)AFVK_authenticationError;

@end
