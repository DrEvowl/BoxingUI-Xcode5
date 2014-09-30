//
//  MasterController.m
//  BoxingUI
//
//  Created by Soulard-Geoffrion, Etienne on 2014-09-30.
//  Copyright (c) 2014 Soulard-Geoffrion, Etienne. All rights reserved.
//

#import "MasterController.h"

@implementation MasterController

+ (id)sharedManager {
    static MasterController *sharedMasterController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMasterController = [[self alloc] init];
    });
    return sharedMasterController;
}

- (id)init {
    if(self == [super init]) {
        
        _boxeurRouge = [[NSString alloc]init];
        _boxeurBleu = [[NSString alloc]init];
        _premierJuge = [[NSString alloc]init];
        _secondJuge = [[NSString alloc]init];
        _troisiemeJuge = [[NSString alloc]init];
        _scoreTotalBoxeurBleu = 0;
        _scoreTotalBoxeurRouge = 0;
    }
    return self;
}

@end
