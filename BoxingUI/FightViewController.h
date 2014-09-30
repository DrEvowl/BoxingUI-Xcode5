//
//  FightViewController.h
//  BoxingUI
//
//  Created by Soulard-Geoffrion, Etienne on 2014-09-30.
//  Copyright (c) 2014 Soulard-Geoffrion, Etienne. All rights reserved.
//

#import <UIKit/UIKit.h>

static const int RED_WINNER = 1;
static const int BLUE_WINNER = -1;
static const int TIE = 0;

@interface FightViewController : UITableViewController{
    NSInteger seconds;
    NSInteger minutes;
    NSTimer *timer;
}

@end
