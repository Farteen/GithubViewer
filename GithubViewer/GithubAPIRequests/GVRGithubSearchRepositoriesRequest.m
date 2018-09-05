//
//  GVRGithubSearchRepositoriesRequest.m
//  GithubViewer
//
//  Created by Glassesd on 2018/9/5.
//  Copyright © 2018 Glassesd. All rights reserved.
//

#import "GVRGithubSearchRepositoriesRequest.h"

@implementation GVRGithubSearchRepositoriesRequest

- (NSString *)path {
    return @"/search/repositories";
}

- (GVRRequestMethod)requestMethod {
    return GVRRequestMethodGET;
}

@end
