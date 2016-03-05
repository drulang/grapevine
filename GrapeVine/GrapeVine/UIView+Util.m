//
//  UIView+Util.m
//  GrapeVine
//
//  Created by Dru Lang on 3/5/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import "UIView+Util.h"

@implementation UIView (Util)

+ (instancetype)autolayoutView {
    UIView *view = [[self alloc] init];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}

@end
