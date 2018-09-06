//
//  KiwiAsync.h
//  GithubViewerTests
//
//  Created by Glassesd on 2018/9/5.
//  Copyright © 2018 Glassesd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Kiwi.h>

#define KiwiAsyncFutureValue(futureValue, timeout) \
     [expectFutureValue(futureValue) shouldEventuallyBeforeTimingOutAfter(timeout)]

#define KiwiAsync(futurevalue) \
 KiwiAsyncFutureValue(futurevalue, 10)
