//
//  NSRegularExpressionAdditionsSpec.m
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 09.10.13.
//
//

#import <Kiwi/Kiwi.h>

#import "NSString+AFVkontakteClientAdditions.h"

SPEC_BEGIN(NSStringExpressionAdditionsSpec)

describe(@"NSStringExpressionAdditionsSpec", ^{
    
    it(@"should find substring between two substrings", ^{
        NSString *string = @"I generally prefer this too";
        [[[string stringBetweenSubstring:@"generally " andSubstring:@" this"] should] equal:@"prefer"];
    });
    
    it(@"should find substring between substring and the end of the given string", ^{
        NSString *string = @"I generally prefer this too";
        [[[string stringBetweenSubstring:@"prefer " andSubstring:@""] should] equal:@"this too"];
    });
    
});

SPEC_END