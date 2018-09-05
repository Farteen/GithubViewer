//
//  GVRHTTPSessionManager.h
//  GithubViewer
//
//  Created by Glassesd on 2018/9/4.
//  Copyright © 2018 Glassesd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface GVRHTTPSessionManager : NSObject

+ (instancetype)sharedSessionManager;

- (AFHTTPSessionManager *)sessionManager:(NSURL *)baseURL;

@end
