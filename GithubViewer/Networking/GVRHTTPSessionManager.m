//
//  GVRHTTPSessionManager.m
//  GithubViewer
//
//  Created by Glassesd on 2018/9/4.
//  Copyright © 2018 Glassesd. All rights reserved.
//

#import "GVRHTTPSessionManager.h"

static GVRHTTPSessionManager *__sharedManager = nil;

@implementation GVRHTTPSessionManager

+ (instancetype)sharedSessionManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedManager = [[[self class] alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.github.com/"]];
    });
    return __sharedManager;
}

@end
