//
//  NSString+AFVkontakteClientAdditions.m
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 09.10.13.
//
//

#import "NSString+AFVkontakteClientAdditions.h"
#import "NSRegularExpression+AFVkontakteClientAdditions.h"

@implementation NSString (AFVkontakteClientAdditions)

- (NSString *)stringBetweenSubstring:(NSString *)substringA andSubstring:(NSString *)substringB{
    
    NSParameterAssert(substringA);
    NSParameterAssert(substringB);
    
    NSString *expressionPattern = [NSString stringWithFormat:@"%@(\\w+?)%@", substringA, substringB];
    return [[[NSRegularExpression regularExpressionWithPattern:expressionPattern options:NSRegularExpressionCaseInsensitive error:nil] matchesSubsctringsInString:self options:0 range:NSMakeRange(0, self.length)] lastObject];
}

@end
