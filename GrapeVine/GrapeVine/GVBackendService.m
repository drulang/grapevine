//
//  GVBackendService.m
//  GrapeVine
//
//  Created by Dru Lang on 2/28/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import "GVBackendService.h"

@implementation GVBackendService

- (NSArray <GVPost *> *)activityFeed {
    GVPost *post1 = [GVPost postWithVideoURL:[NSURL fileURLWithPath:@"gv_1"] title:@"Collab" postText:@"Love this"];
    GVPost *post2 = [GVPost postWithVideoURL:[NSURL fileURLWithPath:@"gv_2"] title:@"Control" postText:nil];
    GVPost *post3 = [GVPost postWithVideoURL:[NSURL URLWithString:@"gv_3"] title:@"Alwyas No. 2" postText:nil];
    
    return @[
             post1,
             post2,
             post3,
             ];
    
}

@end
