//
//  NSErrorAFVkontakteClientSpec.m
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 10.10.13.
//
//

#import <Kiwi/Kiwi.h>

#import "NSError+AFVkontakteClient.h"

SPEC_BEGIN(NSErrorAFVkontakteClientSpec)

describe(@"NSErrorAFVkontakteClientSpec", ^{
    
    it(@"should create authentication error", ^{
        NSError *authenticationError = [NSError AFVK_authenticationError];
        [[authenticationError.localizedDescription should] equal: NSLocalizedString(@"There was a problem authenticating on the server.", @"AFVkontakteClient authenticationError localizedDescription")];
        [[theValue(authenticationError.code) should] equal: theValue(AFVkontakteClientErrorCodeAuthenticationFailed)];
        [[authenticationError.domain should] equal: kAFVkontakteClientErrorDomain];
        [[authenticationError.localizedRecoverySuggestion should] equal: NSLocalizedString(@"Try to re-login to authenticate in Vkontakte.", @"")];
    });
});

SPEC_END
