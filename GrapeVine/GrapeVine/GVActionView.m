//
//  GVActionView.m
//  GrapeVine
//
//  Created by Dru Lang on 3/5/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import "PureLayout.h"
#import "UIView+Util.h"

#import "GVActionView.h"

@interface GVActionView ()

@end

//_______________________________________________________________________________________________________________
// Class Interface

@implementation GVActionView {
    BOOL _constraintsAdded;
}

static CGFloat GVActionViewPreferredImageWidth = 25;
static CGFloat GVActionViewPadding = 8;

#pragma mark Properties

- (UIButton *)actionButton {
    if (!_actionButton) {
        _actionButton = [UIButton autolayoutView];
        [_actionButton setImage:[UIImage imageNamed:@"icon_heart"] forState:UIControlStateNormal];
        _actionButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        _actionButton.tintColor = [UIColor lightGrayColor];
    }
    return _actionButton;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel autolayoutView];
        _titleLabel.font = [UIFont systemFontOfSize:9];
        _titleLabel.textColor = [UIColor lightGrayColor];
        _titleLabel.text = @"OSIPD";
    }
    return _titleLabel;
}

#pragma mark Constructors

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.actionButton];
        [self addSubview:self.titleLabel];
    }
    
    return self;
}

#pragma mark Overrides

- (CGSize)intrinsicContentSize {
    CGFloat width = GVActionViewPreferredImageWidth + (GVActionViewPadding * 2) + self.titleLabel.intrinsicContentSize.width;
    return CGSizeMake(width, GVActionViewPreferredHeight);
}

#pragma mark PureLayout

- (void)updateConstraints {
    if (!_constraintsAdded) {
        [self.actionButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeRight];
        [self.actionButton autoSetDimension:ALDimensionWidth toSize:GVActionViewPreferredImageWidth];
        
        [self.titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.actionButton withOffset:GVActionViewPadding];
        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        
        
        _constraintsAdded = YES;
    }
    [super updateConstraints];
}

@end
