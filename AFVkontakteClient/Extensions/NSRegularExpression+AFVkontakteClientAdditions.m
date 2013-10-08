//
//  NSRegularExpression+AFVkontakteClientAdditions.h
//  AFVkontakteClient
//
//  Created by Антон Домашнев on 10/9/13.
//
//

#import "NSRegularExpression+AFVkontakteClientAdditions.h"

@implementation NSRegularExpression (AFVkontakteClientAdditions)

- (NSArray *)matchesSubsctringsInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range{
    
    NSMutableArray *results = [NSMutableArray array];
    
    [self enumerateMatchesInString:string options:0 range:range usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        if(result.numberOfRanges > 1){
            [results addObject: [string substringWithRange:[result rangeAtIndex:1]]];
        }
        else{
            [results addObject: [string substringWithRange:[result rangeAtIndex:0]]];
        }
    }];
    
    return results;
}

@end
