//
//  GVRGithubSearchingCommitsResponse.h
//  GithubViewer
//
//  Created by Glassesd on 2018/9/6.
//  Copyright © 2018 Glassesd. All rights reserved.
//

#import "GVRHTTPResponse.h"

@interface GVRGithubSearchingCommitsResponse : GVRHTTPResponse

@property (nonatomic, strong) NSNumber *total_count;
@property (nonatomic, assign) BOOL incomplete_results;
@property (nonatomic, strong) NSArray *items;

@end
