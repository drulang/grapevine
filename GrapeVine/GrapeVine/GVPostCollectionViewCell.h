//
//  GVPostCollectionViewCell.h
//  GrapeVine
//
//  Created by Dru Lang on 2/28/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//


#import <UIKit/UIKit.h>

#import "GVPostHeaderView.h"
#import "GVPostFooterView.h"
#import "GVVideoPlayer.h"

static NSString *GVPostCollectionViewCellIdentifier = @"GV Post Cell";


@interface GVPostCollectionViewCell : UICollectionViewCell

@property (nonatomic)GVPostHeaderView *headerView;
@property (nonatomic)GVVideoPlayer *videoPlayer;
@property (nonatomic)GVPostFooterView *footerView;

@end
