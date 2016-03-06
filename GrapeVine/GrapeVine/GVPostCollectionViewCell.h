//
//  GVPostCollectionViewCell.h
//  GrapeVine
//
//  Created by Dru Lang on 2/28/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

static NSString *GVPostCollectionViewCellIdentifier = @"GV Post Cell";


@interface GVPostCollectionViewCell : UICollectionViewCell

@property (nonatomic)AVQueuePlayer *player;

@end