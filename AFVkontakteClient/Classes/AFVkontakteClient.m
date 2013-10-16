//
//  AFVkontakteClient.m
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 07.10.13.
//
//

#import "AFVkontakteClient.h"

static NSString *const kVKBaseURLString = @"https://api.vk.com/method";

@interface AFVkontakteClient()

@property (nonatomic, strong, readwrite) NSString *appID;
@property (nonatomic, strong, readwrite) NSArray *permissions;

@end

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

- (id)initWithBaseURL:(NSURL *)url
{
    NSAssert(NO, @"%@ must be initialized using -initWithVkontakteAppID:withPermissions:", self.class);
	return nil;
}

- (id)initWithVkontakteAppID:(NSString *)appID withPermissions:(NSArray *)permissions
{
    NSParameterAssert(appID);
        
    if(self = [super initWithBaseURL:[NSURL URLWithString:kVKBaseURLString]]){
        
        self.appID = appID;
        self.permissions = permissions ? permissions : [AFVkontakteClient defaultPermissions];
    }
    return self;
}

- (id)init{
    if(self = [super initWithBaseURL:[NSURL URLWithString:kVKBaseURLString]]){
        //TODO: the rest of the auth process
    }
    return self;
}

#pragma mark - Properties

+ (NSArray *)defaultPermissions
{
    return @[@"wall"];
}


@end
