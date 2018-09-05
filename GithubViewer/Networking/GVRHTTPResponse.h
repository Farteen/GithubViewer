//
//  GVRHTTPResponse.h
//  GithubViewer
//
//  Created by Glassesd on 2018/9/5.
//  Copyright © 2018 Glassesd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GVRHTTPResponse : NSObject

- (void)parseHTTPResponseDictionary:(NSDictionary *)dict;

@end
