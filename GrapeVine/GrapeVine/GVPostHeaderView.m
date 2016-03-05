//
//  GVPostHeaderView.m
//  GrapeVine
//
//  Created by Dru Lang on 3/5/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import "PureLayout.h"

#import "GVPostHeaderView.h"

//_______________________________________________________________________________________________________________
// Class Interface

@interface GVPostHeaderView ()

@end

//_______________________________________________________________________________________________________________
// Class Implementation

@implementation GVPostHeaderView

#pragma mark Properties

#pragma mark Constructors

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.subtitleLabel];
        [self addSubview:self.infoSubtitleLabel];
        [self addSubview:self.infoSubtitleLabel];
    }
    
    return self;
}

#pragma mark AL Overrides

@end
