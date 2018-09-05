//
//  GithubAPIStarringSpec.m
//  GithubViewer
//
//  Created by Glassesd on 2018/9/4.
//  Copyright 2018 Glassesd. All rights reserved.
//

#import <Kiwi/Kiwi.h>

SPEC_BEGIN(GithubAPIStarringSpec)
//6e4cd6bcfb2f840f61259edf015ebc612688c950
describe(@"GithubAPIStarring", ^{
    __block GVRHTTPSessionManager *sharedManager = nil;
    beforeAll(^{
        sharedManager = [GVRHTTPSessionManager sharedSessionManager];
    });
    
    beforeEach(^{
        
    });
    
    it(@"check list stargazers", ^{
        __block NSDictionary *dict = nil;
        [sharedManager GET:@"/repos/kiwi-bdd/Kiwi/stargazers" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            dict = responseObject;
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
        [[expectFutureValue(dict) shouldEventuallyBeforeTimingOutAfter(10)] beNonNil];
        
    });
    
    afterEach(^{
        
    });
    
    afterAll(^{
        
    });
    
});

SPEC_END
