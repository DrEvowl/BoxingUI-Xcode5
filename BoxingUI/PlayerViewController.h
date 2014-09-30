//
//  PlayerViewController.h
//  BoxingUI
//
//  Created by Soulard-Geoffrion, Etienne on 2014-09-30.
//  Copyright (c) 2014 Soulard-Geoffrion, Etienne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *NomJoueurRougeTextField;
@property (weak, nonatomic) IBOutlet UILabel *AlerteJoueurRouge;

@property (weak, nonatomic) IBOutlet UITextField *NomJoueurBleuTextField;
@property (weak, nonatomic) IBOutlet UILabel *AlerteJoueurBleu;

-(IBAction)suivantButton:(id)sender;
-(IBAction)assignRedPlayerName:(id)sender;
-(IBAction)assignBluePlayerName:(id)sender;
-(void)initTextFieldsWithName;

@end
