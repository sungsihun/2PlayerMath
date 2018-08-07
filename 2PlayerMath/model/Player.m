//
//  Player.m
//  2PlayerMath
//
//  Created by NICE on 2018-08-06.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init {
    if (self = [super init]) {
        _name = [[NSString alloc] init];
        _score = 0;
        _lives = 3;
    }
    return self;
}

- (NSString *)getScore:(BOOL)evaluateResult {
    if (evaluateResult) {   // user is correct
        self.score++;
    } else {                // user is wrong
        if (self.score > 0){
            self.score--;
        }
        self.lives--;
    }
    
    NSString *scoreString = [[NSString alloc] init];
    scoreString = [NSString stringWithFormat:@"%@ score: %ld", self.name, self.score];
    return scoreString;
}

- (NSInteger)getLives {
        return self.lives;
}

@end
