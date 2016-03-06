//
//  GVVideoPlayer.m
//  GrapeVine
//
//  Created by Dru Lang on 3/6/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>

#import "GVVideoPlayer.h"


//_______________________________________________________________________________________________________________
// Class Interface

@interface GVVideoPlayer ()

@property (nonatomic, readwrite)GVVideoPlayerStatus status;
@property (nonatomic)AVQueuePlayer *player;
@property (nonatomic)AVPlayerLayer *playerLayer;
@property (nonatomic)AVPlayerItem *videoItem;

@end

//_______________________________________________________________________________________________________________
// Class Implementation

@implementation GVVideoPlayer

#pragma mark Properties

- (AVQueuePlayer *)player {
    if (!_player) {
        _player = [[AVQueuePlayer alloc] init];
    }
    return _player;
}

- (AVPlayerLayer *)playerLayer {
    if (!_playerLayer) {
        _playerLayer = [[AVPlayerLayer alloc] init];
        _playerLayer.player = self.player;
    }
    return _playerLayer;
}

- (AVPlayerItem *)videoItem {
    return [[AVPlayerItem alloc] initWithURL:self.videoURL];
}

- (void)setVideoURL:(NSURL *)videoURL {
    [self.player removeAllItems];
    _videoURL = videoURL;
    [self.player insertItem:self.videoItem afterItem:nil];
}

#pragma mark Constructors

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.status = GVVideoPlayerPaused;
    
        [self.layer addSublayer:self.playerLayer];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    }
    
    return self;
}

#pragma mark Overrides

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark Extensions

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.playerLayer.frame = self.bounds;
}

#pragma mark Public Methods


- (void)play {
    self.status = GVVideoPlayerPlaying;
    [self.player play];
}

- (void)pause {
    self.status = GVVideoPlayerPaused;
    [self.player pause];
}

#pragma mark Player Notifications

- (void)playerDidReachEnd:(NSNotification *)note {
    NSLog(@"Player reached end of video. Restarting");
    
    [self.player insertItem:self.videoItem afterItem:nil];
}

@end
