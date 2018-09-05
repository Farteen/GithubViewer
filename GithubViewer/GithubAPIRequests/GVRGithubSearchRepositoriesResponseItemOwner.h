//
//  GVRGithubSearchRepositoriesResponseItemOwner.h
//  GithubViewer
//
//  Created by Glassesd on 2018/9/5.
//  Copyright © 2018 Glassesd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GVRGithubSearchRepositoriesResponseItemOwner : NSObject
@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSNumber *ownerId;
@property (nonatomic, strong) NSString *node_id;
@property (nonatomic, strong) NSString *avatar_url;
@property (nonatomic, strong) NSString *gravatar_id;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *received_events_url;
@property (nonatomic, strong) NSString *type;
@end
