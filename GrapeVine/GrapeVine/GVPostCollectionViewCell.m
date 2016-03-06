//
//  GVPostCollectionViewCell.m
//  GrapeVine
//
//  Created by Dru Lang on 2/28/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import "PureLayout.h"
#import "UIView+Util.h"

#import "GVPostHeaderView.h"
#import "GVPostFooterView.h"

#import "GVPostCollectionViewCell.h"

//_______________________________________________________________________________________________________________
// Class Interface

@interface GVPostCollectionViewCell () {
    BOOL _constraintsAdded;
}

@property (nonatomic)GVPostHeaderView *headerView;
@property (nonatomic)GVPostFooterView *footerView;

@property (nonatomic)AVPlayerLayer *playerLayer;

@end


//_______________________________________________________________________________________________________________
// Class Implementation

@implementation GVPostCollectionViewCell

#pragma mark Properties

- (GVPostHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [GVPostHeaderView autolayoutView];
        _headerView.backgroundColor = [UIColor lightGrayColor];
    }
    return _headerView;
}

- (GVPostFooterView *)footerView {
    if (!_footerView) {
        _footerView = [GVPostFooterView autolayoutView];
        _footerView.backgroundColor = [UIColor lightGrayColor];
    }
    return _footerView;
}

#pragma mark Constructors

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self.contentView addSubview:self.headerView];
        [self.contentView addSubview:self.footerView];
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
