//
//  Player.h
//  2PlayerMath
//
//  Created by NICE on 2018-08-06.
//  Copyright © 2018 NICE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic, assign) NSInteger lives;
@property (nonatomic, assign) NSInteger score;

- (NSString *)getScore:(BOOL)evaluateResult;
- (NSInteger)getLives;

@end
