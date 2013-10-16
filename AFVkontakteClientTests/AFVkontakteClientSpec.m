//
//  AFVkontakteClientSpec.m
//  AFVkontakteClient
//
//  Created by Arseniy Vershinin on 10/9/13.
//
//

#import <Kiwi/Kiwi.h>

#import "AFVkontakteClient.h"

@interface AFVkontakteClient(Tests)

+ (NSArray *)defaultPermissions;

@end


SPEC_BEGIN(AFVkontakteClientSpec)

describe(@"AFVkontakteClient", ^{
    __block AFVkontakteClient *client = nil;
    
    afterEach(^{
        client = nil;
    });
    
    it(@"should be initialized with given appID", ^{
        
        client = [[AFVkontakteClient alloc] initWithVkontakteAppID:@"vkontakteAPP" withPermissions:nil];
        [[client.appID should] equal: @"vkontakteAPP"];
        [[client.baseURL.absoluteString should] equal:@"https://api.vk.com/method/"];
    });
    
    it(@"should be initialized with default permissions if given permissions is nil", ^{
        
        client = [[AFVkontakteClient alloc] initWithVkontakteAppID:@"vkontakteAPP" withPermissions:nil];
        [[client.permissions should] equal: [AFVkontakteClient defaultPermissions]];
    });
    
    it(@"should be initialized with given permissions", ^{
        
        client = [[AFVkontakteClient alloc] initWithVkontakteAppID:@"vkontakteAPP" withPermissions:@[@"user", @"wall"]];
        [[client.permissions should] equal: @[@"user", @"wall"]];
    });
    
});

SPEC_END