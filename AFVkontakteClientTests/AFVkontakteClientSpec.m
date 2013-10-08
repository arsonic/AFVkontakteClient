//
//  AFVkontakteClientSpec.m
//  AFVkontakteClient
//
//  Created by Arseniy Vershinin on 10/9/13.
//
//

#import <Kiwi/Kiwi.h>

#import "AFVkontakteClient.h"

SPEC_BEGIN(AFVkontakteClientSpec)

describe(@"AFVkontakteClient", ^{
    __block AFVkontakteClient *client = nil;
    
    beforeEach(^{
        client = [AFVkontakteClient new];
    });
    
    it(@"should be initialized", ^{
        [[client.baseURL.absoluteString should] equal:@"https://api.vk.com/method/"];
    });
    
});

SPEC_END