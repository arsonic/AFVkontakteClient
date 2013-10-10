//
//  NSString+AFVkontakteClientAdditions.h
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 09.10.13.
//
//

#import <Foundation/Foundation.h>

@interface NSString (AFVkontakteClientAdditions)

/*! Method to find substring in string between two substrings
 * @param substringA Left boundary substring. Zero length means that left boundary is at the start ot the string
 * @param substringB Right boundary substring. Zero length means that right boundary is at the end ot the string
 * @return String between two substrings
 */
- (NSString *)stringBetweenSubstring:(NSString *)substringA andSubstring:(NSString *)substringB;

@end
