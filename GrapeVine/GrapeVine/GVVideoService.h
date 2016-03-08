//
//  GVVideoService.h
//  GrapeVine
//
//  Created by Dru Lang on 3/6/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GVVideoService : NSObject

+ (instancetype)sharedService;

- (void)processVideoFile:(NSURL *)videoURL forTag:(NSInteger)tag completion:(void (^)(NSInteger tag, NSURL *url))completionBlock;

@end
