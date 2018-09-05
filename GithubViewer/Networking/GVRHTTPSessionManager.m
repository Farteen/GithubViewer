//
//  GVRHTTPSessionManager.m
//  GithubViewer
//
//  Created by Glassesd on 2018/9/4.
//  Copyright © 2018 Glassesd. All rights reserved.
//

#import "GVRHTTPSessionManager.h"

static GVRHTTPSessionManager *__sharedManager = nil;

@interface GVRHTTPSessionManager ()

@property (nonatomic, strong)   NSDictionary    *sessionManagerMap;

@end

@implementation GVRHTTPSessionManager

+ (instancetype)sharedSessionManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedManager = [[[self class] alloc] init];
        __sharedManager.sessionManagerMap = [NSDictionary dictionary];
    });
    return __sharedManager;
}

- (AFHTTPSessionManager *)sessionManager:(NSURL *)baseURL {
    NSString *base = baseURL.host;
    if (base.length == 0) {
        base = @"https://api.github.com/";
    }
    AFHTTPSessionManager *manager = self.sessionManagerMap[base];
    if (!manager) {
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
        AFJSONRequestSerializer *req = [AFJSONRequestSerializer serializer];
        [req setValue:@"token 8219787e7c4a64e583f917acb637bc5ab85cdd90" forHTTPHeaderField:@"Authorization"];
        [req setValue:@"application/vnd.github.v3+json" forHTTPHeaderField:@"Accept"];
        AFJSONResponseSerializer *res = [AFJSONResponseSerializer serializer];
        manager.requestSerializer = req;
        manager.responseSerializer = res;
    }
    return manager;
}

@end
