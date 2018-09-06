//
//  GVRGithubSearchRepositoriesResponseItemOwner.m
//  GithubViewer
//
//  Created by Glassesd on 2018/9/5.
//  Copyright © 2018 Glassesd. All rights reserved.
//

#import "GVRGithubSearchRepositoriesResponseItemOwner.h"

@implementation GVRGithubSearchRepositoriesResponseItemOwner

- (void)parseHTTPResponseDictionary:(NSDictionary *)dict {
    self.login = dict[@"login"];
    self.ownerId = dict[@"id"];
    self.node_id = dict[@"node_id"];
    self.avatar_url = dict[@"avatar_url"];
    self.gravatar_id = dict[@"gravatar_id"];
    self.url = dict[@"url"];
    self.received_events_url = dict[@"received_events_url"];
    self.type = dict[@"type"];
}

@end
