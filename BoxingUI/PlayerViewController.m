//
//  PlayerViewController.m
//  BoxingUI
//
//  Created by Soulard-Geoffrion, Etienne on 2014-09-30.
//  Copyright (c) 2014 Soulard-Geoffrion, Etienne. All rights reserved.
//

#import "PlayerViewController.h"
#import "MasterController.h"

@interface PlayerViewController ()

@property (strong,nonatomic) MasterController *masterController;

@end

@implementation PlayerViewController

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
    
    [self.AlerteJoueurBleu setHidden:TRUE];
    [self.AlerteJoueurRouge setHidden:TRUE];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    [self initTextFieldsWithName];
    
    self.masterController = [MasterController sharedManager];}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissKeyboard{
    [self.NomJoueurBleuTextField resignFirstResponder];
    [self.NomJoueurRougeTextField resignFirstResponder];
    
}

-(IBAction)suivantButton:(id)sender{
    
    if([self.NomJoueurBleuTextField.text isEqualToString:@""]){
        [self.AlerteJoueurBleu setHidden:FALSE];
    }else{
        [self.AlerteJoueurBleu setHidden:TRUE];
    }
    
    if([self.NomJoueurRougeTextField.text isEqualToString:@""]){
        [self.AlerteJoueurRouge setHidden:FALSE];
    }else{
        [self.AlerteJoueurRouge setHidden:TRUE];
    }
    
    if(self.AlerteJoueurBleu.hidden && self.AlerteJoueurRouge.hidden){
        [self performSegueWithIdentifier:@"judgeDestination" sender:self];
    }
}

-(IBAction)assignBluePlayerName:(id)sender{
    self.masterController.boxeurBleu = self.NomJoueurBleuTextField.text;
}

-(IBAction)assignRedPlayerName:(id)sender{
    self.masterController.boxeurRouge = self.NomJoueurRougeTextField.text;
}

-(void)initTextFieldsWithName{
    self.NomJoueurBleuTextField.text = self.masterController.boxeurBleu;
    self.NomJoueurRougeTextField.text = self.masterController.boxeurRouge;
}

@end
