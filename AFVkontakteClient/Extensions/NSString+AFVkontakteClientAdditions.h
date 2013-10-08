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
 * \param substringA Left boundary substring
 * \param substringA Right bou ndary substring
 * \return String between two substrings
 */
- (NSString *)stringBetweenSubstring:(NSString *)substringA andSubstring:(NSString *)substringB;

@end
