//
//  AFVkontakteClientLoginViewControllerSpec.m
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 09.10.13.
//
//

#import <Kiwi/Kiwi.h>

#import "AFVkontakteLoginViewController.h"
#import "NSError+AFVkontakteClient.h"

@interface AFVkontakteLoginViewController(Tests)

- (void)parseWebViewResponseString:(NSString *)webViewResponseString
            withCompletionCallback:(void (^)(NSString *authToken, NSString *authorizedUserVkontakteID, NSString *authTokenExpirationUnixTimeString, NSError *error))completion;
- (NSDate *)authTokenExpirationDateFromUnixTimeString:(NSString *)authTokenExpirationUnixTimeString;

@end

SPEC_BEGIN(AFVkontakteClientLoginViewControllerSpec)

describe(@"AFVkontakteLoginViewControllerSpec", ^{
    
    __block AFVkontakteLoginViewController *loginViewController = nil;
    
    beforeEach(^{
        loginViewController = [AFVkontakteLoginViewController new];
    });
    
    it(@"should parse success web view response and return authToken, authTokenExpirationUnixTimeString and userVkontakteID", ^{
        
        NSString *successWebViewResponse = @"http://oauth.vk.com/blank.html#access_token=512e92a4eeb6945b145448b281a6d3778964f872dd1bb17e0c0a8059c10a4cc58297e90d1d5fa65dab2d1&expires_in=86400&user_id=3399582";
        [loginViewController parseWebViewResponseString:successWebViewResponse withCompletionCallback:^(NSString *authToken, NSString *authorizedUserVkontakteID, NSString *authTokenExpirationUnixTimeString, NSError *error) {
            [[authToken should] equal: @"512e92a4eeb6945b145448b281a6d3778964f872dd1bb17e0c0a8059c10a4cc58297e90d1d5fa65dab2d1"];
            [[authorizedUserVkontakteID should] equal: @"3399582"];
            [[authTokenExpirationUnixTimeString should] equal: @"86400"];
        }];
    });
    
    it(@"should parse failure web view response and return AFVK_authenticationError object", ^{
        
        NSString *successWebViewResponse = @"http://oauth.vk.com/blank.html#error=error_reason";
        [loginViewController parseWebViewResponseString:successWebViewResponse withCompletionCallback:^(NSString *authToken, NSString *authorizedUserVkontakteID, NSString *authTokenExpirationUnixTimeString, NSError *error) {
            [[error should] equal: [NSError AFVK_authenticationError]];
        }];
    });
});

SPEC_END

