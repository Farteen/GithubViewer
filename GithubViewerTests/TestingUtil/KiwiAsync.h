//
//  KiwiAsync.h
//  GithubViewerTests
//
//  Created by Glassesd on 2018/9/5.
//  Copyright © 2018 Glassesd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Kiwi.h>

static inline id KiwiAsyncFutureValue(id futureValue, NSTimeInterval timeout) {
    return [expectFutureValue(futureValue) shouldEventuallyBeforeTimingOutAfter(timeout)];
}

static inline id KiwiAsync(id futurevalue) {
    return KiwiAsyncFutureValue(futurevalue, 10);
}
