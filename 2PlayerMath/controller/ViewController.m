//
//  ViewController.m
//  2PlayerMath
//
//  Created by NICE on 2018-08-06.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"
#import "Player.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *questionView;
@property (weak, nonatomic) IBOutlet UILabel *scoreViewPlayer1;
@property (weak, nonatomic) IBOutlet UILabel *scoreViewPlayer2;
@property (nonatomic) GameModel *gameModel;
@property (nonatomic) Player *player1;
@property (nonatomic) Player *player2;
@property (nonatomic) NSString *userInput;
@property (nonatomic) NSInteger playerNumber;

@end





@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _player1 = [[Player alloc] init];
    _player2 = [[Player alloc] init];
    _gameModel = [[GameModel alloc] init];
    _userInput = [[NSString alloc] init];
    _player1.name = @"Player1";
    _player2.name = @"Player2";
    _playerNumber = 1;
    
    [self.questionView setText:[self.gameModel generateQuestion:@"Player1"]];
    
    [self.scoreViewPlayer1 setText:@"Player1 score: 0"];
    [self.scoreViewPlayer2 setText:@"Player2 score: 0"];
}

- (IBAction)buttonZero:(id)sender {
    self.userInput = [self.userInput stringByAppendingString:@"0"];
}

- (IBAction)buttonOne:(id)sender {
    self.userInput = [self.userInput stringByAppendingString:@"1"];
}

- (IBAction)buttonTwo:(id)sender {
    self.userInput = [self.userInput stringByAppendingString:@"2"];
}

- (IBAction)buttonThree:(id)sender {
    self.userInput = [self.userInput stringByAppendingString:@"3"];
}

- (IBAction)buttonFour:(id)sender {
    self.userInput = [self.userInput stringByAppendingString:@"4"];
}

- (IBAction)buttonFive:(id)sender {
    self.userInput = [self.userInput stringByAppendingString:@"5"];
}

- (IBAction)buttonSix:(id)sender {
    self.userInput = [self.userInput stringByAppendingString:@"6"];
}

- (IBAction)buttonSeven:(id)sender {
    self.userInput = [self.userInput stringByAppendingString:@"7"];
}

- (IBAction)buttonEight:(id)sender {
    self.userInput = [self.userInput stringByAppendingString:@"8"];
}

- (IBAction)buttonNine:(id)sender {
    self.userInput = [self.userInput stringByAppendingString:@"9"];
}

- (IBAction)buttonEnter:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"☹️ GAME OVER ☹️" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *gameOverAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
    
    switch (self.playerNumber) {
        case 1 :{
            [self.scoreViewPlayer1 setText:[self.player1 getScore:[self.gameModel evaluate:[self.userInput integerValue]]]];
            
            if ([self.player1 getLives] == 0) {             // game over
                [alert addAction:gameOverAction];
                [self presentViewController:alert animated:YES completion:nil];
                
            } else {
                self.userInput = [[NSString alloc] init];   // initailize the game for next player
                self.gameModel = [[GameModel alloc] init];
                
                [self.questionView setText:[self.gameModel generateQuestion:self.player2.name]];
            }
            self.playerNumber = 2; // switch to player2
            break;
        }
        case 2 : {
            [self.scoreViewPlayer2 setText:[self.player2 getScore:[self.gameModel evaluate:[self.userInput integerValue]]]];
            
            if ([self.player2 getLives] == 0) {             // game over
                [alert addAction:gameOverAction];
                [self presentViewController:alert animated:YES completion:nil];
                
            } else {
                self.userInput = [[NSString alloc] init];   // initailize the game for next player
                self.gameModel = [[GameModel alloc] init];
                
                [self.questionView setText:[self.gameModel generateQuestion:self.player1.name]];
            }
            self.playerNumber = 1; // switch to player1
            break;
        }
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
