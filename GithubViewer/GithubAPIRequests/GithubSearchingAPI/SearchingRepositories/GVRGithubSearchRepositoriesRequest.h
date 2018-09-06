//
//  GVRGithubSearchRepositoriesRequest.h
//  GithubViewer
//
//  Created by Glassesd on 2018/9/5.
//  Copyright © 2018 Glassesd. All rights reserved.
//

#import "GVRHTTPRequest.h"

@interface GVRGithubSearchRepositoriesRequest : GVRHTTPRequest

@property (nonatomic, copy)     NSString    *q;
@property (nonatomic, copy)     NSString    *sort;
@property (nonatomic, copy)     NSString    *order;

@end
