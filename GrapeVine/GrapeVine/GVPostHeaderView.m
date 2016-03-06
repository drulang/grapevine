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
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_1"]];
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel autolayoutView];
        _titleLabel.text = @"Title";
        _titleLabel.font = [UIFont boldSystemFontOfSize:12];
    }
    return _titleLabel;
}

- (UILabel *)subtitleLabel {
    if (!_subtitleLabel) {
        _subtitleLabel = [UILabel autolayoutView];
        _subtitleLabel.text = @"Subtitle";
        _subtitleLabel.font = [UIFont systemFontOfSize:9];
        _subtitleLabel.textColor = [UIColor lightGrayColor];
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
        _infoSubtitleLabel.textColor = self.subtitleLabel.textColor;
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

#pragma mark Extensions

- (void)layoutSubviews {
    [super layoutSubviews];

    self.imageView.layer.cornerRadius = self.imageView.frame.size.height / 2.0;
}

#pragma mark AL Overrides

- (void)updateConstraints {
    
    if (!_contraintsAdded) {
        int imageViewInset = 9;
        
        [self.imageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(imageViewInset, imageViewInset, imageViewInset, imageViewInset) excludingEdge:ALEdgeRight];
        [self.imageView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.imageView];
        
        [self.titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.imageView withOffset:8];
        [self.titleLabel autoConstrainAttribute:ALAttributeBottom toAttribute:ALAttributeMarginAxisVertical ofView:self.imageView withOffset:0
         ];
        
        [self.subtitleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.titleLabel];
        [self.subtitleLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.imageView];
        
        [self.infoTitleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.titleLabel];
        [self.infoTitleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
        
        [self.infoSubtitleLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.infoTitleLabel];
        [self.infoSubtitleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.subtitleLabel];
        
        _contraintsAdded = YES;
    }
    
    [super updateConstraints];
}

@end
