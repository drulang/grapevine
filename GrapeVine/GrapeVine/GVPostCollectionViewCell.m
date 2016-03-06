//
//  GVPostCollectionViewCell.m
//  GrapeVine
//
//  Created by Dru Lang on 2/28/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import "PureLayout.h"
#import "UIView+Util.h"



#import "GVPostCollectionViewCell.h"

//_______________________________________________________________________________________________________________
// Class Interface

@interface GVPostCollectionViewCell () {
    BOOL _constraintsAdded;
}

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

- (GVVideoPlayer *)videoPlayer {
    if (!_videoPlayer) {
        _videoPlayer = [GVVideoPlayer autolayoutView];
    }
    return _videoPlayer;
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
        [self.contentView addSubview:self.videoPlayer];
        [self.contentView addSubview:self.footerView];
    }
    
    return self;
}

- (void)updateConstraints {
    if (!_constraintsAdded) {
        [self.headerView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.headerView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.headerView autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.headerView autoConstrainAttribute:ALAttributeHeight toAttribute:ALAttributeHeight ofView:self.contentView withMultiplier:.10];
        
        [self.videoPlayer autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.videoPlayer autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.videoPlayer autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.headerView];
        [self.videoPlayer autoConstrainAttribute:ALAttributeHeight toAttribute:ALAttributeWidth ofView:self.contentView withMultiplier:1];
        
        _constraintsAdded = YES;
    }
    
    [super updateConstraints];
}

@end
