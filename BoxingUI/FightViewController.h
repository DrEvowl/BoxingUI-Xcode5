//
//  FightViewController.h
//  BoxingUI
//
//  Created by Soulard-Geoffrion, Etienne on 2014-09-30.
//  Copyright (c) 2014 Soulard-Geoffrion, Etienne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FightViewController : UITableViewController{
    NSInteger seconds;
    NSInteger minutes;
    NSTimer *timer;
}

@end
