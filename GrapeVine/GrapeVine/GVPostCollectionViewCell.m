//
//  GVPostCollectionViewCell.m
//  GrapeVine
//
//  Created by Dru Lang on 2/28/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import "PureLayout.h"

#import "GVPostHeaderView.h"

#import "GVPostCollectionViewCell.h"

//_______________________________________________________________________________________________________________
// Class Interface

@interface GVPostCollectionViewCell () {
    BOOL _constraintsAdded;
}

@property (nonatomic)GVPostHeaderView *headerView;
@property (nonatomic)AVPlayerLayer *playerLayer;

@end


//_______________________________________________________________________________________________________________
// Class Implementation

@implementation GVPostCollectionViewCell

#pragma mark Properties

- (GVPostHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [GVPostHeaderView new];
        _headerView.translatesAutoresizingMaskIntoConstraints = NO;
        _headerView.backgroundColor = [UIColor lightGrayColor];
    }
    return _headerView;
}

#pragma mark Constructors

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self.contentView addSubview:self.headerView];
    }
    
    return self;
}

- (void)updateConstraints {
    if (!_constraintsAdded) {
        [self.headerView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.headerView autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.headerView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.headerView autoSetDimension:ALDimensionHeight toSize:50];
        
        _constraintsAdded = YES;
    }
    
    [super updateConstraints];
}

@end
