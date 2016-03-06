//
//  GVPostFooterView.h
//  GrapeVine
//
//  Created by Dru Lang on 3/5/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import "GVActionView.h"

#import <UIKit/UIKit.h>

@interface GVPostFooterView : UIView

@property (nonatomic)UILabel *descriptionLabel;

@property (nonatomic)UIButton *descriptionActionButton;
@property (nonatomic)GVActionView *action1View;
@property (nonatomic)GVActionView *action2View;
@property (nonatomic)GVActionView *action3View;
@property (nonatomic)UIButton *additionalActionsButton;

@end
