//
//  GVPostHeaderView.m
//  GrapeVine
//
//  Created by Dru Lang on 3/5/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import "PureLayout.h"

#import "UIView+Util.h"

#import "GVPostHeaderView.h"

//_______________________________________________________________________________________________________________
// Class Interface

@interface GVPostHeaderView ()

@end

//_______________________________________________________________________________________________________________
// Class Implementation

@implementation GVPostHeaderView {
    BOOL _contraintsAdded;
}

#pragma mark Properties

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        _imageView.backgroundColor = [UIColor yellowColor];
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel autolayoutView];
        _titleLabel.text = @"Title";
        _titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return _titleLabel;
}

- (UILabel *)subtitleLabel {
    if (!_subtitleLabel) {
        _subtitleLabel = [UILabel autolayoutView];
        _subtitleLabel.text = @"Subtitle";
        _subtitleLabel.font = [UIFont systemFontOfSize:9];
    }
    return _subtitleLabel;
}

- (UILabel *)infoTitleLabel {
    if (!_infoTitleLabel) {
        _infoTitleLabel = [UILabel autolayoutView];
        _infoTitleLabel.text = @"Info Title";
        _infoTitleLabel.font = self.titleLabel.font;
    }
    return _infoTitleLabel;
}

- (UILabel *)infoSubtitleLabel {
    if (!_infoSubtitleLabel) {
        _infoSubtitleLabel = [UILabel autolayoutView];
        _infoSubtitleLabel.text = @"Info SubTitle";
        _infoSubtitleLabel.font = self.subtitleLabel.font;
    }
    return _infoSubtitleLabel;
}

#pragma mark Constructors

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.subtitleLabel];
        [self addSubview:self.infoTitleLabel];
        [self addSubview:self.infoSubtitleLabel];
        
        [self setNeedsUpdateConstraints];
    }

    return self;
}

#pragma mark AL Overrides

- (void)updateConstraints {
    
    if (!_contraintsAdded) {
        [self.imageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) excludingEdge:ALEdgeRight];
        [self.imageView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.imageView];
        
        [self.titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.imageView withOffset:8];
        [self.titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.imageView];
        
        [self.subtitleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.titleLabel];
        [self.subtitleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:3];
        
        [self.infoTitleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.titleLabel];
        [self.infoTitleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
        
        [self.infoSubtitleLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.infoTitleLabel];
        [self.infoSubtitleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.subtitleLabel];
        
        _contraintsAdded = YES;
    }
    
    [super updateConstraints];
}

@end
