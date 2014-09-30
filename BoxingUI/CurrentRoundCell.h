//
//  CurrentRoundCell.h
//  BoxingUI
//
//  Created by Soulard-Geoffrion, Etienne on 2014-09-30.
//  Copyright (c) 2014 Soulard-Geoffrion, Etienne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterController.h"
#import "FightViewController.h"

@interface CurrentRoundCell : UITableViewCell

@property (strong, nonatomic) MasterController *masterController;
@property (strong, nonatomic) FightViewController *fightViewController;

@property (weak, nonatomic) IBOutlet UILabel *numeroRound;
@property (weak, nonatomic) IBOutlet UILabel *jugeName;

@property (nonatomic) int scoreJugeUnBleu;
@property (nonatomic) int scoreJugeUnRouge;

@property (nonatomic) int fautesBleu;
@property (nonatomic) int fautesRouge;

@property (weak, nonatomic) IBOutlet UIButton *scoreButton6Rouge;
@property (weak, nonatomic) IBOutlet UIButton *scoreButton7Rouge;
@property (weak, nonatomic) IBOutlet UIButton *scoreButton8Rouge;
@property (weak, nonatomic) IBOutlet UIButton *scoreButton9Rouge;
@property (weak, nonatomic) IBOutlet UIButton *scoreButton10Rouge;

@property (weak, nonatomic) IBOutlet UILabel *fautesRougesLabel;
@property (weak, nonatomic) IBOutlet UIButton *fautesRougeButton;


@property (weak, nonatomic) IBOutlet UIButton *scoreButton6Bleu;
@property (weak, nonatomic) IBOutlet UIButton *scoreButton7Bleu;
@property (weak, nonatomic) IBOutlet UIButton *scoreButton8Bleu;
@property (weak, nonatomic) IBOutlet UIButton *scoreButton9Bleu;
@property (weak, nonatomic) IBOutlet UIButton *scoreButton10Bleu;

@property (weak, nonatomic) IBOutlet UILabel *fautesBleuLabel;
@property (weak, nonatomic) IBOutlet UIButton *fautesBleuButton;



@property(nonatomic) NSInteger cancelButtonIndex;

@property(nonatomic) NSInteger confirmButtonIndex;

-(IBAction)getScoreRougeFromButton:(id)sender;
-(IBAction)getScoreBleuFromButton:(id)sender;

-(IBAction)setFautesBleu:(id)sender;
-(IBAction)setFautesRouge:(id)sender;

-(void)initialize:(FightViewController *)fightViewController;

-(IBAction)RedKOButton:(UIButton *)sender;

-(IBAction)BlueKOButton:(UIButton *)sender;

-(IBAction)RedDQButton:(UIButton *)sender;

-(IBAction)BlueDQButton:(UIButton *)sender;

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end
