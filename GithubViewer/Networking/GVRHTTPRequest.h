//
//  GVRRequest.h
//  GithubViewer
//
//  Created by Glassesd on 2018/9/5.
//  Copyright © 2018 Glassesd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
@class GVRHTTPResponse;
typedef NS_ENUM(NSInteger, GVRRequestMethod) {
    GVRRequestMethodGET,
    GVRRequestMethodPOST
};
@interface GVRHTTPRequest : NSObject

@property (nonatomic, copy)     void(^didFinished)(NSURLSessionTask *task, __kindof GVRHTTPResponse  *response);
@property (nonatomic, copy)     void(^didFailed)(NSURLSessionTask *task, NSError *error);

- (GVRRequestMethod)requestMethod;

- (NSURL *)baseURL;

- (NSString *)path;

- (NSDictionary *)params;

- (void)startRequest;

@end
