//
//  SummaryCell.h
//  BoxingUI
//
//  Created by Soulard-Geoffrion, Etienne on 2014-09-30.
//  Copyright (c) 2014 Soulard-Geoffrion, Etienne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SummaryCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *numeroRound;

@property (weak, nonatomic) IBOutlet UILabel *jugeUn;
@property (weak, nonatomic) IBOutlet UILabel *jugeDeux;
@property (weak, nonatomic) IBOutlet UILabel *jugeTrois;

@property (weak, nonatomic) IBOutlet UILabel *scoreJugeUnBleu;
@property (weak, nonatomic) IBOutlet UILabel *scoreJugeUnRouge;

@property (weak, nonatomic) IBOutlet UILabel *scoreJugeDeuxBleu;
@property (weak, nonatomic) IBOutlet UILabel *scoreJugeDeuxRouge;

@property (weak, nonatomic) IBOutlet UILabel *scoreJugeTroisBleu;
@property (weak, nonatomic) IBOutlet UILabel *scoreJugeTroisRouge;

@end
