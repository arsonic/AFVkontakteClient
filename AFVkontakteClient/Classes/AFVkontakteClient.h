//
//  AFVkontakteClient.h
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 07.10.13.
//
//

#import <AFNetworking/AFHTTPRequestOperationManager.h>

typedef void(^AFVkontakteAuthBlock)(NSString *authToken, NSString *userID, NSDate *expirationDate, NSError *error);

@interface AFVkontakteClient : AFHTTPRequestOperationManager


@end
