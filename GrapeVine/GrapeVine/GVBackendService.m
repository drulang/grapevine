//
//  GVBackendService.m
//  GrapeVine
//
//  Created by Dru Lang on 2/28/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import "GVUtil.h"

#import "GVBackendService.h"

@implementation GVBackendService

static GVBackendService *service = nil;

#pragma mark Singleton/Constructors

+ (instancetype)sharedService {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self alloc] init];
    });
    return service;
}

#pragma mark Public Methods

- (NSArray <GVPost *> *)activityFeed {

    GVPost *post1 = [GVPost postWithVideoURL:[GVUtil videoUrlForVideoName:@"/gv_1.mp4"] title:@"Collab" postText:@"Love this"];
    post1.username = @"AshleyStrongarm";
    post1.loopCount = @"2,251,499";
    post1.postDate = @"1/13/16";
    post1.profileImageName = @"user_1";
    post1.likeCount = @"7.5k";
    post1.commentCount = @"184";
    post1.externalLinkCount = @"1.1k";
    
    GVPost *post2 = [GVPost postWithVideoURL:[GVUtil videoUrlForVideoName:@"/gv_2.mp4"] title:@"Control" postText:nil];
    post2.username = @"Luke Berti";
    post2.loopCount = @"3,134,188";
    post2.postDate = @"6/4/15";
    post2.profileImageName = @"user_2";
    post2.likeCount = @"17k";
    post2.commentCount = @"513";
    post2.externalLinkCount = @"2.3k";
    
    
    GVPost *post3 = [GVPost postWithVideoURL:[GVUtil videoUrlForVideoName:@"/gv_3.mp4"] title:@"Alwyas No. 2" postText:nil];
    post3.username = @"Nicholas Megalis";
    post3.loopCount = @"3,244";
    post3.postDate = @"17h";
    post3.profileImageName = @"user_3";
    post3.likeCount = @"4.2k";
    post3.commentCount = @"75";
    post3.externalLinkCount = @"987k";
    
    return @[
             post1,
             post2,
             post3,
             ];
    
}

@end
