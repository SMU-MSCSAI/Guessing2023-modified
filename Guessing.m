//
//  Guessing.m
//  Guessing2023-personal
//
//  Created by Tango Tew on 9/6/23.
//

#import "Guessing.h"
@interface Guessing()
@property (strong, nonatomic) NSNumber* correctNumber;
@property (strong, nonatomic) NSMutableArray* range; //The range the user has guessed
@end

@implementation Guessing

-(NSNumber*)correctNumber {
    if(!_correctNumber){
        _correctNumber = @(arc4random_uniform(100)+1);
    }
    return _correctNumber;
}

-(NSMutableArray*)range {
    if(!_range){
        _range = [@[@1, @100] mutableCopy];
    }
    return _range;
}
-(NSInteger)lowerBound{
    return [self.range[0] intValue];
}

-(NSInteger)upperBound{
    return [self.range[1] intValue];
}

-(void)setLowerBound: (NSNumber*)val{
    self.range[0] = val;
}

-(void)setUpperBound: (NSNumber*)val{
    self.range[1] = val;
}

-(GuessValue)makeGuess:(NSInteger)guessNumber{
    //cast the number to an integer(pointer to literal)
    NSInteger correctNum = [self.correctNumber intValue];
    if(guessNumber == correctNum){
        //set the lowerbound and upperbound as the correct answer
        [self setLowerBound:@(guessNumber)];
        [self setUpperBound:@(guessNumber)];
        return GuessValueCorrect;
    }
    else if(correctNum > guessNumber){ // If the user guess higher than the correct, set the
        [self setLowerBound:@(guessNumber)];
        return GuessValueLower;
    }
    else{
        [self setUpperBound:@(guessNumber)];
        return GuessValueHigher;
    }
}

@end
