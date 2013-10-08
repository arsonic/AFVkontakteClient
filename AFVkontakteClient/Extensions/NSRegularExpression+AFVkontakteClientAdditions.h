//
//  NSRegularExpression+AFVkontakteClientAdditions.h
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 10/9/13.
//  
//

#import <Foundation/Foundation.h>

@interface NSRegularExpression (AFVkontakteClientAdditions)

- (NSArray *)matchesSubsctringsInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range;

@end
