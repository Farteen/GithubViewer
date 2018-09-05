//
//  GVRGithubSearchRepositoriesResponse.m
//  GithubViewer
//
//  Created by Glassesd on 2018/9/5.
//  Copyright © 2018 Glassesd. All rights reserved.
//

#import "GVRGithubSearchRepositoriesResponse.h"

@implementation GVRGithubSearchRepositoriesResponse

- (void)parseJSON:(NSDictionary *)dict {
    self.total_count = dict[@"total_count"];
    self.incomplete_results = [dict[@"incomplete_results"]booleanValue];
    self.items = dict[@"items"];
}

@end
