//
//  GVRGithubSearchingCommitsResponse.m
//  GithubViewer
//
//  Created by Glassesd on 2018/9/6.
//  Copyright © 2018 Glassesd. All rights reserved.
//

#import "GVRGithubSearchingCommitsResponse.h"

@implementation GVRGithubSearchingCommitsResponse

- (void)parseJSON:(NSDictionary *)dict {
    self.total_count = dict[@"total_count"];
    self.incomplete_results = [dict[@"incomplete_results"] boolValue];
    self.items = dict[@"items"];
}

@end
