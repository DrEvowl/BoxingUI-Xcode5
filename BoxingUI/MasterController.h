//
//  MasterController.h
//  BoxingUI
//
//  Created by Soulard-Geoffrion, Etienne on 2014-09-30.
//  Copyright (c) 2014 Soulard-Geoffrion, Etienne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MasterController : NSObject

@property (nonatomic, retain) NSString *boxeurBleu;
@property (nonatomic, retain) NSString *boxeurRouge;

@property (nonatomic, retain) NSString *premierJuge;
@property (nonatomic, retain) NSString *secondJuge;
@property (nonatomic, retain) NSString *troisiemeJuge;

@property (nonatomic) NSInteger *scoreTotalBoxeurRouge;
@property (nonatomic) NSInteger *scoreTotalBoxeurBleu;


+ (id)sharedManager;

@end
