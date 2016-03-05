//
//  GVPostCollectionViewCell.m
//  GrapeVine
//
//  Created by Dru Lang on 2/28/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import "GVPostCollectionViewCell.h"

//_______________________________________________________________________________________________________________
// Class Interface

@interface GVPostCollectionViewCell ()

@property (nonatomic)AVPlayerLayer *playerLayer;

@end


//_______________________________________________________________________________________________________________
// Class Implementation

@implementation GVPostCollectionViewCell

#pragma mark Constructors

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self.contentView.layer addSublayer:self.playerLayer];
    }
    
    return self;
}

#pragma mark Helpers

- (void)setupConstraints {
    
}

@end
