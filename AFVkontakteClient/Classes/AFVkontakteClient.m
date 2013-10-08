//
//  AFVkontakteClient.m
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 07.10.13.
//
//

#import "AFVkontakteClient.h"

static NSString *const kVKBaseURLString = @"https://api.vk.com/method";

@implementation AFVkontakteClient

/*****************************************************/
#pragma mark - Initialization
/*****************************************************/

static AFVkontakteClient *sharedInstance;
+ (AFVkontakteClient *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [AFVkontakteClient new];
    });
    return sharedInstance;
}

- (id)init{
    if(self = [super initWithBaseURL:[NSURL URLWithString:kVKBaseURLString]]){
        //TODO: the rest of the auth process
    }
    return self;
}

@end
