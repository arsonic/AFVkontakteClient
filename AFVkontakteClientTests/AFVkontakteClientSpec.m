//
//  AFVkontakteClientSpec.m
//  AFVkontakteClientSpec
//
//  Created by Arseniy Vershinin on 10/7/13.
//
//

#import <Kiwi/Kiwi.h>

SPEC_BEGIN(AFVkontakteClientSpec)

describe(@"AFVkontakteClient", ^{
   
    it(@"should be initialized", ^{
        [[theValue(2+2) should] equal:theValue(4)];
    });
    
});

SPEC_END
