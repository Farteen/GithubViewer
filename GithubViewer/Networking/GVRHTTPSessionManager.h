//
//  GVRHTTPSessionManager.h
//  GithubViewer
//
//  Created by Glassesd on 2018/9/4.
//  Copyright © 2018 Glassesd. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface GVRHTTPSessionManager : AFHTTPSessionManager

+ (instancetype)sharedSessionManager;

@end
