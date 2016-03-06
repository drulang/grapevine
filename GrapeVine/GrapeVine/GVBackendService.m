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
    GVPost *post2 = [GVPost postWithVideoURL:[GVUtil videoUrlForVideoName:@"/gv_2.mp4"] title:@"Control" postText:nil];
    GVPost *post3 = [GVPost postWithVideoURL:[GVUtil videoUrlForVideoName:@"/gv_3.mp4"] title:@"Alwyas No. 2" postText:nil];
    
    return @[
             post1,
             post2,
             post3,
             ];
    
}

@end
