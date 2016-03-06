//
//  GVVideoPlayer.h
//  GrapeVine
//
//  Created by Dru Lang on 3/6/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GVVideoPlayer : UIView

- (void)playVideo:(NSURL *)videoURL;

- (void)play;
- (void)pause;

@end
