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
        AFJSONRequestSerializer *req = [AFJSONRequestSerializer serializer];
        [req setValue:@"token a43f4e4d626cf1beb8b8d221d9d1f41126cc7581" forHTTPHeaderField:@"Authorization"];
        [req setValue:@"application/vnd.github.v3+json" forHTTPHeaderField:@"Accept"];
        AFJSONResponseSerializer *res = [AFJSONResponseSerializer serializer];
        __sharedManager.requestSerializer = req;
        __sharedManager.responseSerializer = res;
    });
    return __sharedManager;
}

@end
