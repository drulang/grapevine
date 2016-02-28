//
//  GVBackendService.h
//  GrapeVine
//
//  Created by Dru Lang on 2/28/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import "GVPost.h"

#import <Foundation/Foundation.h>

@interface GVBackendService : NSObject

+ (instancetype)sharedService;

- (NSArray <GVPost *> *)activityFeed;

@end
