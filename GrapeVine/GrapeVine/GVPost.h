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

+ (instancetype)postWithVideoURL:(NSURL *)videoURL title:(NSString *)title postText:(NSString *)postText;

@end
