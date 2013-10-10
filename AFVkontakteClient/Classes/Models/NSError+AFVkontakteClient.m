//
//  NSError+AFVkontakteClient.m
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 10.10.13.
//
//

#import "NSError+AFVkontakteClient.h"

NSString *const kAFVkontakteClientErrorDomain = @"AFVkontakteClientErrorDomain";

@implementation NSError (AFVkontakteClient)

+ (NSError *)AFVK_authenticationError
{
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey: NSLocalizedString(@"There was a problem authenticating on the server.", @"AFVkontakteClient authenticationError localizedDescription"),
                               NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Try to re-login to authenticate in Vkontakte.", @""),
                               };
    
	return [NSError errorWithDomain:kAFVkontakteClientErrorDomain code:AFVkontakteClientErrorCodeAuthenticationFailed userInfo:userInfo];
}

@end
