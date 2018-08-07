//
//  GameModel.h
//  2PlayerMath
//
//  Created by NICE on 2018-08-06.
//  Copyright © 2018 NICE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameModel : NSObject

@property (nonatomic) NSInteger leftNumber;
@property (nonatomic) NSInteger rightNumber;
@property (nonatomic) NSString *questionString;
@property (nonatomic) NSInteger answer;

- (NSString *)generateQuestion:(NSString *)name;
- (BOOL)evaluate:(NSInteger)inputAns;

@end
