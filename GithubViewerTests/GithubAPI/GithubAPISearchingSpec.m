//
//  GithubAPISearchingSpec.m
//  GithubViewer
//
//  Created by Glassesd on 2018/9/5.
//  Copyright 2018 Glassesd. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "GVRGithubSearchRepositoriesRequest.h"
#import "GVRGithubSearchRepositoriesResponse.h"
#import "GVRGithubSearchRepositoriesResponseItem.h"
#import "GVRGithubSearchRepositoriesResponseItemOwner.h"

SPEC_BEGIN(GithubAPISearchingSpec)

describe(@"GithubAPISearching", ^{
    __block GVRGithubSearchRepositoriesRequest *searchReq = nil;
    beforeAll(^{
        searchReq = [[GVRGithubSearchRepositoriesRequest alloc] init];
        searchReq.q = @"AFNetworking";
    });
    
    beforeEach(^{
        
    });
    
    it(@"check search req", ^{
        
        [searchReq setDidFinished:^(NSURLSessionTask *task, __kindof GVRGithubSearchRepositoriesResponse *response) {
            
        }];
        [searchReq setDidFailed:^(NSURLSessionTask *task, NSError *error) {
            
        }];
        [searchReq startRequest];
        [KiwiAsync(searchReq.response) beNonNil];
    });
    
    afterEach(^{
        
    });
    
    afterAll(^{
        
    });
    
});

SPEC_END
