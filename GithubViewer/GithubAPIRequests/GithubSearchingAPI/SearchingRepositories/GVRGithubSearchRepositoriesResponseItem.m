//
//  GVRGithubSearchRepositoriesResponseItem.m
//  GithubViewer
//
//  Created by Glassesd on 2018/9/5.
//  Copyright © 2018 Glassesd. All rights reserved.
//

#import "GVRGithubSearchRepositoriesResponseItem.h"
#import "GVRGithubSearchRepositoriesResponseItemOwner.h"
@implementation GVRGithubSearchRepositoriesResponseItem

- (void)parseHTTPResponseDictionary:(NSDictionary *)dict {
    self.itemId = dict[@"id"];
    self.node_id = dict[@"node_id"];
    self.name = dict[@"name"];
    self.full_name = dict[@"full_name"];
    
    NSDictionary *dictOwner = dict[@"owner"];
    self.owner = [[GVRGithubSearchRepositoriesResponseItemOwner alloc] init];
    [self.owner parseHTTPResponseDictionary:dictOwner];
    
    self.isPrivate = [dict[@"private"] boolValue];
    self.html_url = dict[@"html_url"];
    self.itemDesc = dict[@"description"];
    self.fork = [dict[@"fork"] boolValue];
    self.url = dict[@"url"];
    self.created_at = dict[@"created_at"];
    self.updated_at = dict[@"updated_at"];
    self.pushed_at = dict[@"pushed_at"];
    self.homepage = dict[@"homepage"];
    self.size = dict[@"size"];
    self.stargazers_count = dict[@"stargazers_count"];
    self.watchers_count = dict[@"watchers_count"];
    self.language = dict[@"language"];
    self.forks_count = dict[@"forks_count"];
    self.open_issues_count = dict[@"open_issues_count"];
    self.master_branch = dict[@"master_branch"];
    self.default_branch = dict[@"default_branch"];
    self.score = dict[@"score"];
}

@end
