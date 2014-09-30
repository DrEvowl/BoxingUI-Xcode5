//
//  FightViewController.m
//  BoxingUI
//
//  Created by Soulard-Geoffrion, Etienne on 2014-09-30.
//  Copyright (c) 2014 Soulard-Geoffrion, Etienne. All rights reserved.
//

#import "FightViewController.h"
#import "MasterController.h"

#import "SummaryCell.h"
#import "CurrentRoundCell.h"
#import "TableHeader.h"

#import "Round.h"

@interface FightViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) NSMutableArray *rounds;
@property (strong, nonatomic) TableHeader *tableHeader;
@property (strong, nonatomic) MasterController *masterController;

@end

@implementation FightViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.rounds = [[NSMutableArray alloc] init];
    self.masterController = [MasterController sharedManager];
    
    [self setupGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableView isEditing] ? self.rounds.count + 1 : self.rounds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    NSLog(@"Row: %i",indexPath.row);
    
    //Configure the cell
    if ([tableView isEditing]) {
        if (indexPath.row == 0) {
            
            cell = [tableView dequeueReusableCellWithIdentifier:@"CurrentRoundCell" forIndexPath:indexPath];
            
            CurrentRoundCell *currentCell = (CurrentRoundCell *)cell;
            currentCell.numeroRound.text = [NSString stringWithFormat:@"%i",self.rounds.count + 1];
            currentCell.jugeUn.text = self.masterController.premierJuge;
        } else {
            
            Round *round = self.rounds[indexPath.row - 1];
            cell = [tableView dequeueReusableCellWithIdentifier:@"SummaryCell" forIndexPath:indexPath];
            SummaryCell *summaryCell = (SummaryCell *)cell;
            
            summaryCell.numeroRound.text = round.numeroRound;
            
            summaryCell.jugeUn.text = round.jugeUn;
            summaryCell.jugeDeux.text = round.jugeDeux;
            summaryCell.jugeTrois.text = round.jugeTrois;
            
            summaryCell.scoreJugeUnRouge.text = [NSString stringWithFormat:@"%i",[round.scoreJugeUnRouge intValue]];
            summaryCell.scoreJugeUnBleu.text = [NSString stringWithFormat:@"%i",[round.scoreJugeUnBleu intValue]];
            
            summaryCell.scoreJugeDeuxRouge.text = [NSString stringWithFormat:@"%i",[round.scoreJugeDeuxRouge intValue]];
            summaryCell.scoreJugeDeuxBleu.text = [NSString stringWithFormat:@"%i",[round.scoreJugeDeuxBleu intValue]];
            
            summaryCell.scoreJugeTroisRouge.text = [NSString stringWithFormat:@"%i",[round.scoreJugeTroisRouge intValue]];
            summaryCell.scoreJugeTroisBleu.text = [NSString stringWithFormat:@"%i",[round.scoreJugeTroisBleu intValue]];
            
        }
    }
    else {
        
        Round *round = self.rounds[indexPath.row];
        cell = [tableView dequeueReusableCellWithIdentifier:@"SummaryCell" forIndexPath:indexPath];
        SummaryCell *summaryCell = (SummaryCell *)cell;
        
        summaryCell.numeroRound.text = round.numeroRound;
        
        summaryCell.jugeUn.text = round.jugeUn;
        summaryCell.jugeDeux.text = round.jugeDeux;
        summaryCell.jugeTrois.text = round.jugeTrois;
        
        summaryCell.scoreJugeUnRouge.text = [NSString stringWithFormat:@"%i",[round.scoreJugeUnRouge intValue]];
        summaryCell.scoreJugeUnBleu.text = [NSString stringWithFormat:@"%i",[round.scoreJugeUnBleu intValue]];
        
        summaryCell.scoreJugeDeuxRouge.text = [NSString stringWithFormat:@"%i",[round.scoreJugeDeuxRouge intValue]];
        summaryCell.scoreJugeDeuxBleu.text = [NSString stringWithFormat:@"%i",[round.scoreJugeDeuxBleu intValue]];
        
        summaryCell.scoreJugeTroisRouge.text = [NSString stringWithFormat:@"%i",[round.scoreJugeTroisRouge intValue]];
        summaryCell.scoreJugeTroisBleu.text = [NSString stringWithFormat:@"%i",[round.scoreJugeTroisBleu intValue]];
    }
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        NSLog(@"Row: %i",indexPath.row);
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.rounds.count inSection:0]];
        CurrentRoundCell *currentCell = (CurrentRoundCell *)cell;
        
        //configuring and inserting Round in Array
        Round *round = [[Round alloc]initWithTitle:[NSString stringWithFormat:@"%i",self.rounds.count + 1]
                                            jugeUn:self.masterController.premierJuge
                                          jugeDeux:self.masterController.secondJuge
                                         jugeTrois:self.masterController.troisiemeJuge
                                  scoreJugeUnRouge:[NSNumber numberWithInt:[currentCell.scoreJugeUnRouge.text intValue]]
                                   scoreJugeUnBleu:[NSNumber numberWithInt:[currentCell.scoreJugeUnBleu.text intValue]]
                                scoreJugeDeuxRouge:[self randomNumberBetween:[NSNumber numberWithInt:6] maxNumber:[NSNumber numberWithInt:10]]
                                 scoreJugeDeuxBleu:[self randomNumberBetween:[NSNumber numberWithInt:6] maxNumber:[NSNumber numberWithInt:10]]
                                scoreJugeTroisBleu:[self randomNumberBetween:[NSNumber numberWithInt:6] maxNumber:[NSNumber numberWithInt:10]]
                               scoreJugeTroisRouge:[self randomNumberBetween:[NSNumber numberWithInt:6] maxNumber:[NSNumber numberWithInt:10]]];
        [self.rounds addObject:round];
        
        self.masterController.scoreTotalBoxeurRouge += [round.scoreJugeDeuxRouge intValue];
        self.masterController.scoreTotalBoxeurBleu += [round.scoreJugeDeuxBleu intValue];
        
        [tableView beginUpdates];
        [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.rounds.count inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
        //Modification du score total dans le Header
        self.tableHeader.scoreTotaljoueurRouge.text = [NSString stringWithFormat:@"%i",(int)self.masterController.scoreTotalBoxeurRouge];
        self.tableHeader.scoreTotaljoueurBleu.text = [NSString stringWithFormat:@"%i",(int)self.masterController.scoreTotalBoxeurBleu];
        [tableView endUpdates];
        
        [self setEditing:NO animated:YES];
        
        if (self.rounds.count < 12)
            [self setEditing:YES animated:YES];
        if (self.rounds.count == 12) {
            UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Joueur Bleu Gagnant!"
                                                          message:@"Le match the box est termniner."
                                                         delegate:self
                                                cancelButtonTitle:@"Quitter"
                                                otherButtonTitles:@"Rejouer", nil];
            [alert show];
            
        }
        
    }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
    if ([self.tableView isEditing]) {
        [self.tableView beginUpdates];
        
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
        minutes = 2;
        seconds = 59;
        self.tableHeader.timer.text = @"3:00";
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                 target:self
                                               selector:@selector(subtractTime)
                                               userInfo:nil
                                                repeats:YES];
        
        [self.tableView endUpdates];
    } else {
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && tableView.editing) {
        return 163;
    } else {
        return 85;
    }
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && self.editing) {
        return UITableViewCellEditingStyleInsert;
    } else {
        return UITableViewCellEditingStyleNone;
    }
}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    static NSString *CellIdentifier = @"TableHeader";
    self.tableHeader = (TableHeader *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (self.tableHeader == nil){
        [NSException raise:@"headerView == nil.." format:@"No cells with matching CellIdentifier loaded from your storyboard"];
    }
    
    self.tableHeader.joueurBleu.text = self.masterController.boxeurBleu;
    self.tableHeader.joueurRouge.text = self.masterController.boxeurRouge;
    self.tableHeader.scoreTotaljoueurRouge.text = @"0";
    self.tableHeader.scoreTotaljoueurBleu.text = @"0";
    
    return self.tableHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if ([title isEqualToString:@"Quitter"]) {
        exit(0);
    }
    else if ([title isEqualToString:@"Rejouer"]) {
        [self performSegueWithIdentifier:@"rejouerSegue" sender:self];
    }
}

- (NSNumber *)randomNumberBetween:(NSNumber *)min maxNumber:(NSNumber *)max
{
    int minn = [min intValue];
    int maxx = [max intValue];
    int res = minn + arc4random_uniform(maxx - minn + 1);
    return [NSNumber numberWithInt:res];
}

-(void)subtractTime {
    seconds--;
    if(seconds == 0)
    {
        minutes--;
        if(seconds == 0 && minutes == 0) {
            [timer invalidate];
        }
        
        [self.tableView beginUpdates];
        self.tableHeader.timer.text = [NSString stringWithFormat:@"0%i:00",minutes];
        [self.tableView endUpdates];
        seconds = 59;
    }
    else if (seconds < 10)
    {
        [self.tableView beginUpdates];
        self.tableHeader.timer.text = [NSString stringWithFormat:@"0%i:0%i",minutes,seconds];
        [self.tableView endUpdates];
    }
    else {
        [self.tableView beginUpdates];
        self.tableHeader.timer.text = [NSString stringWithFormat:@"0%i:%i",minutes,seconds];
        [self.tableView endUpdates];
    }
    
}

-(void)setupGame
{
    [self setEditing:YES animated:YES];
}


@end
