//
//  GVPostFooterView.m
//  GrapeVine
//
//  Created by Dru Lang on 3/5/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import "PureLayout.h"
#import "UIView+Util.h"

#import "GVPostFooterView.h"

@implementation GVPostFooterView {
    BOOL _constraintsAdded;
}

#pragma mark Properties

- (UILabel *)descriptionLabel {
    if (!_descriptionLabel) {
        _descriptionLabel = [UILabel autolayoutView];
        _descriptionLabel.text = @"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500";
        _descriptionLabel.font = [UIFont systemFontOfSize:14];
        _descriptionLabel.numberOfLines = 0;
    }
    return _descriptionLabel;
}

- (UIButton *)descriptionActionButton {
    if (!_descriptionActionButton) {
        _descriptionActionButton = [UIButton autolayoutView];
        [_descriptionActionButton setTitle:@"People also watched >" forState:UIControlStateNormal];
        _descriptionActionButton.titleLabel.font = [UIFont systemFontOfSize:9];
        [_descriptionActionButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }
    return _descriptionActionButton;
}

- (GVActionView *)action1View {
    if (!_action1View) {
        _action1View = [GVActionView autolayoutView];
        UIImage *image = [[UIImage imageNamed:@"icon_heart"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [_action1View.actionButton setImage:image forState:UIControlStateNormal];
    }
    
    return _action1View;
}

- (GVActionView *)action2View {
    if (!_action2View) {
        _action2View = [GVActionView autolayoutView];
        UIImage *image = [[UIImage imageNamed:@"icon_message"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [_action2View.actionButton setImage:image forState:UIControlStateNormal];
    }
    
    return _action2View;
}

- (GVActionView *)action3View {
    if (!_action3View) {
        _action3View = [GVActionView autolayoutView];
        UIImage *image = [[UIImage imageNamed:@"icon_external_link"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [_action3View.actionButton setImage:image forState:UIControlStateNormal];
    }
    
    return _action3View;
}

- (UIButton *)additionalActionsButton {
    if (!_additionalActionsButton) {
        _additionalActionsButton = [UIButton autolayoutView];
        
        UIImage *iconImage = [[UIImage imageNamed:@"icon_more"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        
        [_additionalActionsButton setImage:iconImage forState:UIControlStateNormal];
        _additionalActionsButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        _additionalActionsButton.imageEdgeInsets = UIEdgeInsetsMake(5, 0, 5, 0);
        _additionalActionsButton.tintColor = [UIColor lightGrayColor];
    }
    return _additionalActionsButton;
}

#pragma mark Constructors

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.descriptionLabel];
        [self addSubview:self.descriptionActionButton];
        [self addSubview:self.action1View];
        [self addSubview:self.action2View];
        [self addSubview:self.action3View];
        [self addSubview:self.additionalActionsButton];
        
        [self setNeedsUpdateConstraints];
    }
    
    return self;
}

#pragma mark PureLayout Extensions

- (void)updateConstraints {
    if (!_constraintsAdded) {
        CGFloat defaultPadding = 8;
        CGFloat defaultActionViewPadding = 16;
        
        [self.descriptionLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(defaultPadding, defaultPadding, 0, defaultPadding) excludingEdge:ALEdgeBottom];
        
        [self.descriptionActionButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.descriptionLabel];
        [self.descriptionActionButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.descriptionLabel withOffset:3];
        
        [self.action1View autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.descriptionLabel];
        [self.action1View autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.descriptionActionButton withOffset:12];
        [self.action1View autoSetDimension:ALDimensionHeight toSize:GVActionViewPreferredHeight];
        
        [self.action2View autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.action1View withOffset:defaultActionViewPadding];
        [self.action2View autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.action1View];
        [self.action2View autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.action1View];
        
        [self.action3View autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.action2View withOffset:defaultActionViewPadding];
        [self.action3View autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.action1View];
        [self.action3View autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.action1View];
        
        [self.additionalActionsButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:defaultPadding];
        [self.additionalActionsButton autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.action1View];
        [self.additionalActionsButton autoSetDimension:ALDimensionHeight toSize:self.action1View.intrinsicContentSize.height];
        [self.additionalActionsButton autoSetDimension:ALDimensionWidth toSize:self.action1View.intrinsicContentSize.width / 2.0];
        
        _constraintsAdded = YES;
    }
    
    [super updateConstraints];
}

@end
