//
//  Guessing.h
//  Guessing2023-personal
//
//  Created by Tango Tew on 9/6/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum: NSUInteger {
    GuessValueLower,
    GuessValueCorrect,
    GuessValueHigher
} GuessValue;

// TODO: Create make guess method
// TODO: expose the lower and upperbound
@interface Guessing : NSObject
//returnType methodName paramType  paramName
-(GuessValue)makeGuess:(NSInteger) guessNumber;
-(NSInteger) lowerBound;
-(NSInteger) upperBound;
@end

NS_ASSUME_NONNULL_END
