//
//  GVVideoPlayer.h
//  GrapeVine
//
//  Created by Dru Lang on 3/6/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GVVideoPlayerStatus) {
    GVVideoPlayerPlaying,
    GVVideoPlayerPaused,
};

//_______________________________________________________________________________________________________________
// Class Interface

@interface GVVideoPlayer : UIView

@property (nonatomic)NSURL *videoURL;
@property (nonatomic, readonly)GVVideoPlayerStatus status;

- (void)play;
- (void)pause;

@end
