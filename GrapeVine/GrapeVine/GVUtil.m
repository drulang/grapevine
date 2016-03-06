//
//  GVUtil.m
//  GrapeVine
//
//  Created by Dru Lang on 3/6/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import "GVUtil.h"

@implementation GVUtil

+ (NSURL *)videoUrlForVideoName:(NSString *)videoName {
    NSString *filename = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:videoName];
    return [NSURL fileURLWithPath:filename];
}

@end
