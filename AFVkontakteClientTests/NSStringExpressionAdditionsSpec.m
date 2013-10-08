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
    
});

SPEC_END