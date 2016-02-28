//
//  GVPost.m
//  GrapeVine
//
//  Created by Dru Lang on 2/28/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import "GVPost.h"

@implementation GVPost

+ (instancetype)postWithVideoURL:(NSURL *)videoURL title:(NSString *)title postText:(NSString *)postText {
    GVPost *post = [GVPost new];
    post.videoURL = videoURL;
    post.title = title;
    post.postText = postText;
    return post;
}

@end
