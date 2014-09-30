//
//  CurrentRoundCell.m
//  BoxingUI
//
//  Created by Soulard-Geoffrion, Etienne on 2014-09-30.
//  Copyright (c) 2014 Soulard-Geoffrion, Etienne. All rights reserved.
//

#import "CurrentRoundCell.h"

@implementation CurrentRoundCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

-(void)initialize:(FightViewController *)fightViewController
{
    self.masterController = [MasterController sharedManager];
    self.fightViewController = fightViewController;
    _scoreJugeUnBleu = 10;
    _scoreJugeUnRouge = 10;
    
    _fautesBleu = 0;
    _fautesRouge = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)getScoreBleuFromButton:(id)sender
{
    UIButton *button = (UIButton *)sender;
    if ([button isEqual:self.scoreButton6Bleu]) {
        self.masterController.scoreCourantBleu = 6;
        [self resetBackgroundColorBlueSide];
        button.backgroundColor = [UIColor grayColor];
    }
    else if ([button isEqual:self.scoreButton7Bleu]) {
        self.masterController.scoreCourantBleu = 7;
        [self resetBackgroundColorBlueSide];
        button.backgroundColor = [UIColor grayColor];
    }
    else if ([button isEqual:self.scoreButton8Bleu]) {
        self.masterController.scoreCourantBleu = 8;
        [self resetBackgroundColorBlueSide];
        button.backgroundColor = [UIColor grayColor];
    }
    else if ([button isEqual:self.scoreButton9Bleu]) {
        self.masterController.scoreCourantBleu = 9;
        [self resetBackgroundColorBlueSide];
        button.backgroundColor = [UIColor grayColor];
    }
    else if ([button isEqual:self.scoreButton10Bleu]) {
        self.masterController.scoreCourantBleu = 10;
        [self resetBackgroundColorBlueSide];
        button.backgroundColor = [UIColor grayColor];
    }
}

-(IBAction)getScoreRougeFromButton:(id)sender
{
    UIButton *button = (UIButton *)sender;
    if ([button isEqual:self.scoreButton6Rouge]) {
        self.masterController.scoreCourantRouge = 6;
        [self resetBackgroundColorRedSide];
        button.backgroundColor = [UIColor grayColor];
    }
    else if ([button isEqual:self.scoreButton7Rouge]) {
        self.masterController.scoreCourantRouge = 7;
        [self resetBackgroundColorRedSide];
        button.backgroundColor = [UIColor grayColor];
    }
    else if ([button isEqual:self.scoreButton8Rouge]) {
        self.masterController.scoreCourantRouge = 8;
        [self resetBackgroundColorRedSide];
        button.backgroundColor = [UIColor grayColor];
    }
    else if ([button isEqual:self.scoreButton9Rouge]) {
        self.masterController.scoreCourantRouge = 9;
        [self resetBackgroundColorRedSide];
        button.backgroundColor = [UIColor grayColor];
    }
    else if ([button isEqual:self.scoreButton10Rouge]) {
        self.masterController.scoreCourantRouge = 10;
        [self resetBackgroundColorRedSide];
        button.backgroundColor = [UIColor grayColor];
    }
}

-(IBAction)setFautesBleu:(id)sender
{
    _fautesBleu++;
    self.masterController.scoreCourantBleu = self.masterController.scoreCourantBleu - 1;
    self.fautesBleuLabel.text = [NSString stringWithFormat:@"%i",_fautesBleu];
}

-(IBAction)setFautesRouge:(id)sender
{
    _fautesRouge++;
     self.masterController.scoreCourantRouge = self.masterController.scoreCourantRouge - 1;
    self.fautesRougesLabel.text = [NSString stringWithFormat:@"%i",_fautesRouge];
}


-(IBAction)RedKOButton:(UIButton *)sender{
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Combat terminé" message:@"Le boxeur rouge a gagné par KO!\n\n\n" delegate:self cancelButtonTitle:@"Quitter" otherButtonTitles:@"Rejouer",nil];
//    UITextField *textField = [[UITextField alloc] init];
//    [textField setBackgroundColor:[UIColor whiteColor]];
//    textField.borderStyle = UITextBorderStyleLine;
//    textField.frame = CGRectMake(15, 75, 255, 30);
//    textField.placeholder = @"Preset Name";
//    textField.keyboardAppearance = UIKeyboardAppearanceAlert;
//    [textField becomeFirstResponder];
//    [alert addSubview:textField];
    [alert show];
}

-(IBAction)BlueKOButton:(UIButton *)sender{
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Combat terminé" message:@"Le boxeur bleu a gagné par KO!?\n\n\n" delegate:self cancelButtonTitle:@"Quitter"                                    otherButtonTitles:@"Rejouer", nil];
    UITextField *textField = [[UITextField alloc] init];
    [textField setBackgroundColor:[UIColor whiteColor]];
    textField.borderStyle = UITextBorderStyleLine;
    textField.frame = CGRectMake(15, 75, 255, 30);
    textField.placeholder = @"Preset Name";
    textField.keyboardAppearance = UIKeyboardAppearanceAlert;
    [textField becomeFirstResponder];
    [alert addSubview:textField];
    [alert show];
}

-(IBAction)BlueDQButton:(UIButton *)sender{
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Combat terminé"  message:@"Le boxeur rouge a été disqualifié!\n\n\n" delegate:self cancelButtonTitle:@"Quitter" otherButtonTitles:@"Rejouer", nil];
    UITextField *textField = [[UITextField alloc] init];
    [textField setBackgroundColor:[UIColor whiteColor]];
    textField.borderStyle = UITextBorderStyleLine;
    textField.frame = CGRectMake(15, 75, 255, 30);
    textField.placeholder = @"Preset Name";
    textField.keyboardAppearance = UIKeyboardAppearanceAlert;
    [textField becomeFirstResponder];
    [alert addSubview:textField];
    [alert show];
}

-(IBAction)RedDQButton:(UIButton *)sender{

    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Combat terminé" message:@"Le boxeur bleu a été disqualifié!\n\n\n" delegate:self cancelButtonTitle:@"Quitter" otherButtonTitles:@"Rejouer", nil];
    UITextField *textField = [[UITextField alloc] init];
    [textField setBackgroundColor:[UIColor whiteColor]];
    textField.borderStyle = UITextBorderStyleLine;
    textField.frame = CGRectMake(15, 75, 255, 30);
    textField.placeholder = @"Preset Name";
    textField.keyboardAppearance = UIKeyboardAppearanceAlert;
    [textField becomeFirstResponder];
    [alert addSubview:textField];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (!buttonIndex == [alertView cancelButtonIndex]) {
        [self.fightViewController performSegueWithIdentifier:@"StartPage" sender:self];
    }
    else{
        exit(0);
        
    }
    
}

-(void)resetBackgroundColorBlueSide
{
    self.scoreButton6Bleu.backgroundColor = [UIColor clearColor];
    self.scoreButton7Bleu.backgroundColor = [UIColor clearColor];
    self.scoreButton8Bleu.backgroundColor = [UIColor clearColor];
    self.scoreButton9Bleu.backgroundColor = [UIColor clearColor];
    self.scoreButton10Bleu.backgroundColor = [UIColor clearColor];
}

-(void)resetBackgroundColorRedSide
{
    self.scoreButton6Rouge.backgroundColor = [UIColor clearColor];
    self.scoreButton7Rouge.backgroundColor = [UIColor clearColor];
    self.scoreButton8Rouge.backgroundColor = [UIColor clearColor];
    self.scoreButton9Rouge.backgroundColor = [UIColor clearColor];
    self.scoreButton10Rouge.backgroundColor = [UIColor clearColor];
}


@end
