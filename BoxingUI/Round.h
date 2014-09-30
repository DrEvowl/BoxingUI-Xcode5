//
//  Round.h
//  BoxingUI
//
//  Created by Soulard-Geoffrion, Etienne on 2014-09-30.
//  Copyright (c) 2014 Soulard-Geoffrion, Etienne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Round : NSObject

@property (strong, nonatomic) NSString *numeroRound;

@property (strong, nonatomic) NSString *jugeUn;
@property (strong, nonatomic) NSString *jugeDeux;
@property (strong, nonatomic) NSString *jugeTrois;

@property (strong, nonatomic) NSNumber *scoreJugeUnBleu;
@property (strong, nonatomic) NSNumber *scoreJugeUnRouge;

@property (strong, nonatomic) NSNumber *scoreJugeDeuxBleu;
@property (strong, nonatomic) NSNumber *scoreJugeDeuxRouge;

@property (strong, nonatomic) NSNumber *scoreJugeTroisBleu;
@property (strong, nonatomic) NSNumber *scoreJugeTroisRouge;

- (instancetype)initWithTitle:(NSString *)numeroRound
                       jugeUn:(NSString *)jugeUn
                     jugeDeux:(NSString *)jugeDeux
                    jugeTrois:(NSString *)jugeTrois
             scoreJugeUnRouge:(NSNumber *)scoreJugeUnRouge
              scoreJugeUnBleu:(NSNumber *)scoreJugeUnBleu
           scoreJugeDeuxRouge:(NSNumber *)scoreJugeDeuxRouge
            scoreJugeDeuxBleu:(NSNumber *)scoreJugeDeuxBleu
           scoreJugeTroisBleu:(NSNumber *)scoreJugeTroisBleu
          scoreJugeTroisRouge:(NSNumber *)scoreJugeTroisRouge;

@end
