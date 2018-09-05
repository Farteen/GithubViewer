//
//  GVRRequest.m
//  GithubViewer
//
//  Created by Glassesd on 2018/9/5.
//  Copyright © 2018 Glassesd. All rights reserved.
//

#import "GVRHTTPRequest.h"
#import "GVRHTTPSessionManager.h"
#import "GVRHTTPResponse.h"

@implementation GVRHTTPRequest

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)startRequest {
    switch ([self requestMethod]) {
        case GVRRequestMethodGET:
            [self startGET];
            break;
        case GVRRequestMethodPOST:
            [self startPOST];
            break;
        default:
            break;
    }
}

- (NSURL *)baseURL {
    return nil;
}

- (AFHTTPSessionManager *)manager {
    AFHTTPSessionManager *manager = [[GVRHTTPSessionManager sharedSessionManager] sessionManager:[self baseURL]];
    return manager;
}

- (void)startGET {
    __weak GVRHTTPRequest *weakSelf = self;
    [[self manager] GET:[self path] parameters:[self params] progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        __strong GVRHTTPRequest *strongSelf = weakSelf;
        [strongSelf handleFinished:task response:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        __strong GVRHTTPRequest *strongSelf = weakSelf;
        [strongSelf handleFailed:task error:error];
    }];
}

- (void)startPOST {
    __weak GVRHTTPRequest *weakSelf = self;
    [[self manager] POST:[self path] parameters:[self params] progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        __strong GVRHTTPRequest *strongSelf = weakSelf;
        [strongSelf handleFinished:task response:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        __strong GVRHTTPRequest *strongSelf = weakSelf;
        [strongSelf handleFailed:task error:error];

    }];
}

- (void)handleFinished:(NSURLSessionTask *)task response:(NSDictionary *)responseObject {
    if (self.didFinished) {
        GVRHTTPResponse *response = [[[self bindingRepsonseClass] alloc] init];
        [response parseHTTPResponseDictionary:responseObject];
        self.response = response;
        self.didFinished(task, response);
    }
}

- (void)handleFailed:(NSURLSessionTask *)task error:(NSError *)error {
    if (self.didFailed) {
        self.didFailed(task, error);
    }
}

- (Class)bindingRepsonseClass {
    NSString *requestClass = NSStringFromClass([self class]);
    NSString *responseClass = [requestClass stringByReplacingOccurrencesOfString:@"Request" withString:@"Response"];
    if (NSClassFromString(responseClass)) {
        return NSClassFromString(responseClass);
    }
    return [GVRHTTPResponse class];
}


@end
