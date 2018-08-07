//
//  GameModel.m
//  2PlayerMath
//
//  Created by NICE on 2018-08-06.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

- (instancetype)init {
    if (self = [super init]) {
        _questionString = [[NSString alloc] init];
        _leftNumber = arc4random_uniform(21) + 1;
        _rightNumber = arc4random_uniform(21) + 1;
        _answer = _leftNumber + _rightNumber;
    }
    return self;
}


- (NSString *)generateQuestion:(NSString*)name {
    self.questionString = [NSString stringWithFormat:@"%@: %ld + %ld ?", name, self.leftNumber, self.rightNumber];
    return self.questionString;
}


- (BOOL)evaluate:(NSInteger)inputAns {
    if (inputAns == self.answer) {
        return YES;   // answer is correct
    } else {
        return NO;    // answer is wrong
    }
}


@end
