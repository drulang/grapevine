//
//  GVTabBarButton.m
//  GrapeVine
//
//  Created by Dru Lang on 3/6/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import "GVTabBarButton.h"

@implementation GVTabBarButton

static CGFloat GVTabBarButton_vInsetSize = 8;

#pragma mark Constructors

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.imageEdgeInsets = UIEdgeInsetsMake(GVTabBarButton_vInsetSize, 0, GVTabBarButton_vInsetSize, 0);
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.tintColor = [UIColor colorWithRed:127/255.0 green:125/255.0 blue:123/255.0 alpha:1];
    }
    
    return self;
}

#pragma mark Extensions

- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    UIImage *templateImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [super setImage:templateImage forState:UIControlStateNormal];
}

@end
