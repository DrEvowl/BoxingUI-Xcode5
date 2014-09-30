//
//  JudgeViewController.h
//  BoxingUI
//
//  Created by Soulard-Geoffrion, Etienne on 2014-09-30.
//  Copyright (c) 2014 Soulard-Geoffrion, Etienne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JudgeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *NomJuge1TextField;
@property (weak, nonatomic) IBOutlet UILabel *AlerteNomPremierJuge;

@property (weak, nonatomic) IBOutlet UITextField *NomJuge2TextField;
@property (weak, nonatomic) IBOutlet UILabel *AlerteNomDeuxiemeJuge;

@property (weak, nonatomic) IBOutlet UITextField *NomJuge3TextField;
@property (weak, nonatomic) IBOutlet UILabel *AlerteNomTroisiemeJuge;


-(IBAction)assignFirstJudgeName:(id)sender;
-(IBAction)assignSecondJudgeName:(id)sender;
-(IBAction)assignThirdJudgeName:(id)sender;
-(IBAction)buttonHit:(UIButton *)sender;

@end
