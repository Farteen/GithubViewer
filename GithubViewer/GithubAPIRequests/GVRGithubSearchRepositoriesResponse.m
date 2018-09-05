//
//  GVRGithubSearchRepositoriesResponse.m
//  GithubViewer
//
//  Created by Glassesd on 2018/9/5.
//  Copyright © 2018 Glassesd. All rights reserved.
//

#import "GVRGithubSearchRepositoriesResponse.h"
#import "GVRGithubSearchRepositoriesResponseItem.h"

@implementation GVRGithubSearchRepositoriesResponse

- (void)parseJSON:(NSDictionary *)dict {
    self.total_count = dict[@"total_count"];
    self.incomplete_results = [dict[@"incomplete_results"] boolValue];
    NSArray *arrItems = dict[@"items"];
    NSMutableArray *marrItems = [NSMutableArray arrayWithCapacity:arrItems.count];
    [arrItems enumerateObjectsUsingBlock:^(NSDictionary *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        GVRGithubSearchRepositoriesResponseItem *item = [[GVRGithubSearchRepositoriesResponseItem alloc] init];
        [item parseJSON:obj];
        [marrItems addObject:item];
    }];
    self.items = [marrItems copy];
}

@end
