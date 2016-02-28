//
//  GVPost.h
//  GrapeVine
//
//  Created by Dru Lang on 2/28/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GVPost : NSObject

@property (nonatomic)NSURL *videoURL;
@property (nonatomic)NSString *title;
@property (nonatomic)NSString *postText;

@property (nonatomic)NSString *username;

@property (nonatomic)NSNumber *loopCount;
@property (nonatomic)NSNumber *likeCount;
@property (nonatomic)NSNumber *repostCount;
@property (nonatomic)NSNumber *linkCount;

+ (instancetype)postWithVideoURL:(NSURL *)videoURL title:(NSString *)title postText:(NSString *)postText;


@end
