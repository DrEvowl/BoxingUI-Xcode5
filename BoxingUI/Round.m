//
//  Round.m
//  BoxingUI
//
//  Created by Soulard-Geoffrion, Etienne on 2014-09-30.
//  Copyright (c) 2014 Soulard-Geoffrion, Etienne. All rights reserved.
//

#import "Round.h"

@implementation Round

-(instancetype)initWithTitle:(NSString *)numeroRound jugeUn:(NSString *)jugeUn jugeDeux:(NSString *)jugeDeux jugeTrois:(NSString *)jugeTrois scoreJugeUnRouge:(int)scoreJugeUnRouge scoreJugeUnBleu:(int)scoreJugeUnBleu scoreJugeDeuxRouge:(NSNumber *)scoreJugeDeuxRouge scoreJugeDeuxBleu:(NSNumber *)scoreJugeDeuxBleu scoreJugeTroisBleu:(NSNumber *)scoreJugeTroisBleu scoreJugeTroisRouge:(NSNumber *)scoreJugeTroisRouge
{
    if (self == [super init]) {
        _numeroRound = numeroRound;
        
        _jugeUn = jugeUn;
        _jugeDeux = jugeDeux;
        _jugeTrois = jugeTrois;
        
        _scoreJugeUnRouge = scoreJugeUnRouge;
        _scoreJugeUnBleu = scoreJugeUnBleu;
        
        _scoreJugeDeuxRouge = scoreJugeDeuxRouge;
        _scoreJugeDeuxBleu = scoreJugeDeuxBleu;
        
        _scoreJugeTroisRouge = scoreJugeTroisRouge;
        _scoreJugeTroisBleu = scoreJugeTroisBleu;
    }
    return self;
}


@end
