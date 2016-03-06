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
    // Remove previous child controllers
    for (UIViewController *vc in _viewControllers) {
        [vc.view removeFromSuperview];
        [vc removeFromParentViewController];
        [vc didMoveToParentViewController:nil];
    }
    
    _viewControllers = viewControllers;
    
    for (UIViewController *vc in _viewControllers) {
        [self addChildViewController:vc];
        [vc didMoveToParentViewController:self];
    }
    
    [self transitionToSelectedIndex];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    
    if (_selectedIndex >= self.viewControllers.count) {
        _selectedIndex = self.viewControllers.count - 1;
    } else if (_selectedIndex <= 1) {
        _selectedIndex = 0;
    }
    
    [self transitionToSelectedIndex];
}

#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.contentView];
    [self.view addSubview:self.tabBarView];
    
    [self.view setNeedsUpdateConstraints];
}

#pragma mark PureLayout Extensions

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

#pragma mark Helpers

- (void)transitionToSelectedIndex {
    UIViewController *vc = [self.viewControllers objectAtIndex:self.selectedIndex];
    
    [self.contentView addSubview:vc.view];
    
    vc.view.frame = self.contentView.bounds;
}

@end
