//
//  AFVkontakteClient.h
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 07.10.13.
//
//

#import <AFNetworking/AFHTTPRequestOperationManager.h>

@interface AFVkontakteClient : AFHTTPRequestOperationManager

/** @brief Identifies the Vkontakte app which the client represents. */
@property (nonatomic, readonly) NSString *appID;

/** @brief The permissions granted to the access token during the authentication flow. */
@property(nonatomic, readonly) NSArray *permissions;

/**
 * @brief Singleton AFVkontakteClient object initialized with initWithVkontakteAppID:withPermissions: initializer.
 * @return An AFVkontakteClient shared instance object
 */
+ (instancetype)sharedInstance;

/**
 * @brief Initializes the receiver to make requests to the Vkontakte server from the app with given app id with default base URL.
 *
 * @param appID The Vkontakte App ID. Can't be nil.
 * @param permissions An array of strings representing the permissions to request during the
 * authentication flow. A value of nil indicates basic permissions. The default is nil.
 *
 * @return An AFVkontakteClient object
 */
- (id)initWithVkontakteAppID:(NSString *)appID withPermissions:(NSArray *)permissions;

@end
