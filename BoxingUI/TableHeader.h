//
//  TableHeader.h
//  BoxingUI
//
//  Created by Soulard-Geoffrion, Etienne on 2014-09-30.
//  Copyright (c) 2014 Soulard-Geoffrion, Etienne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableHeader : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *timer;

@property (weak, nonatomic) IBOutlet UILabel *joueurRouge;
@property (weak, nonatomic) IBOutlet UILabel *joueurBleu;

@property (weak, nonatomic) IBOutlet UILabel *scoreTotaljoueurRouge;
@property (weak, nonatomic) IBOutlet UILabel *scoreTotaljoueurBleu;

@end
