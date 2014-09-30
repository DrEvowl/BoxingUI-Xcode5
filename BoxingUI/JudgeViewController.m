//
//  JudgeViewController.m
//  BoxingUI
//
//  Created by Soulard-Geoffrion, Etienne on 2014-09-30.
//  Copyright (c) 2014 Soulard-Geoffrion, Etienne. All rights reserved.
//

#import "JudgeViewController.h"
#import "MasterController.h"

@interface JudgeViewController ()

@property (strong,nonatomic) MasterController *masterController;

@end

@implementation JudgeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.AlerteNomPremierJuge setHidden:TRUE];
    [self.AlerteNomDeuxiemeJuge setHidden:TRUE];
    [self.AlerteNomTroisiemeJuge setHidden:TRUE];
	
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    [self initTextfieldsWithName];
    
    self.masterController = [MasterController sharedManager];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissKeyboard{
    [self.NomJuge1TextField resignFirstResponder];
    [self.NomJuge2TextField resignFirstResponder];
    [self.NomJuge3TextField resignFirstResponder];
}

-(IBAction)buttonHit:(UIButton *)sender{
    
    if([self.NomJuge1TextField.text isEqualToString:@""]){
        [self.AlerteNomPremierJuge setHidden:FALSE];
    }else{
        [self.AlerteNomPremierJuge setHidden:TRUE];
    }
    
    if([self.NomJuge2TextField.text isEqualToString:@""]){
        [self.AlerteNomDeuxiemeJuge setHidden:FALSE];
    }else{
        [self.AlerteNomDeuxiemeJuge setHidden:TRUE];
    }
    
    if([self.NomJuge3TextField.text isEqualToString:@""]){
        [self.AlerteNomTroisiemeJuge setHidden:FALSE];
    }else{
        [self.AlerteNomTroisiemeJuge setHidden:TRUE];
    }
    
    if(self.AlerteNomPremierJuge.hidden && self.AlerteNomDeuxiemeJuge.hidden && self.AlerteNomTroisiemeJuge.hidden){
        if([[sender currentTitle] isEqualToString:@"Retour"]){
            [self performSegueWithIdentifier:@"boxeurDestination" sender:self];
        }else{
            [self performSegueWithIdentifier:@"fightDestination" sender:self];
            
        }
    }
}

-(IBAction)assignFirstJudgeName:(id)sender{
    self.masterController.premierJuge = self.NomJuge1TextField.text;
}

-(IBAction)assignSecondJudgeName:(id)sender{
    self.masterController.secondJuge = self.NomJuge2TextField.text;
}

-(IBAction)assignThirdJudgeName:(id)sender{
    self.masterController.troisiemeJuge = self.NomJuge3TextField.text;
}

-(void)initTextfieldsWithName{
    self.NomJuge1TextField.text = self.masterController.premierJuge;
    self.NomJuge2TextField.text = self.masterController.secondJuge;
    self.NomJuge3TextField.text = self.masterController.troisiemeJuge;
}

@end
