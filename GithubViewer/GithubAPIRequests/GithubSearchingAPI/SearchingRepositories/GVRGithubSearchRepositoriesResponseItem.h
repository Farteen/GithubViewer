//
//  GVRGithubSearchRepositoriesResponseItem.h
//  GithubViewer
//
//  Created by Glassesd on 2018/9/5.
//  Copyright © 2018 Glassesd. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GVRGithubSearchRepositoriesResponseItemOwner;
@interface GVRGithubSearchRepositoriesResponseItem : NSObject

@property (nonatomic, strong) NSNumber *itemId;
@property (nonatomic, strong) NSString *node_id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *full_name;
@property (nonatomic, strong) GVRGithubSearchRepositoriesResponseItemOwner *owner;
@property (nonatomic, assign) BOOL isPrivate;
@property (nonatomic, strong) NSString *html_url;
@property (nonatomic, strong) NSString *itemDesc;
@property (nonatomic, assign) BOOL fork;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, strong) NSString *updated_at;
@property (nonatomic, strong) NSString *pushed_at;
@property (nonatomic, strong) NSString *homepage;
@property (nonatomic, strong) NSNumber *size;
@property (nonatomic, strong) NSNumber *stargazers_count;
@property (nonatomic, strong) NSNumber *watchers_count;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSNumber *forks_count;
@property (nonatomic, strong) NSNumber *open_issues_count;
@property (nonatomic, strong) NSString *master_branch;
@property (nonatomic, strong) NSString *default_branch;
@property (nonatomic, strong) NSNumber *score;

@end
