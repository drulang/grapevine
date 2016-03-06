//
//  GVTabBarController.m
//  GrapeVine
//
//  Created by Dru Lang on 2/28/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//
#import "PureLayout.h"
#import "UIView+Util.h"

#import "GVTabBarController.h"

@interface GVTabBarController ()

@property (nonatomic)UIView *contentView;
@property (nonatomic, readwrite)UIView *tabBarView;

@end

@implementation GVTabBarController {
    BOOL _addedConstraints;
}

#pragma mark Properties

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView autolayoutView];
        _contentView.backgroundColor = [UIColor greenColor];
    }
    return _contentView;
}

- (UIView *)tabBarView {
    if (!_tabBarView) {
        _tabBarView = [UIView autolayoutView];
        _tabBarView.backgroundColor = [UIColor colorWithRed:53/255.0 green:53/255.0 blue:52/255.0 alpha:1];
    }
    return _tabBarView;
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers {
    _viewControllers = viewControllers;
}

#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.contentView];
    [self.view addSubview:self.tabBarView];
    
    [self.view setNeedsUpdateConstraints];
}

#pragma mark PL Extensions

- (void)updateViewConstraints {
    if (!_addedConstraints) {
        
        [self.tabBarView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.tabBarView autoSetDimension:ALDimensionHeight toSize:40];
        
        [self.contentView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.contentView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.tabBarView];
        
        _addedConstraints = YES;
    }
    
    [super updateViewConstraints];
}

@end
