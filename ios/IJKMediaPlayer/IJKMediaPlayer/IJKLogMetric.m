//
//  IJKLogMetric.m
//  IJKMediaPlayer
//
//  Created by Matt Mo on 8/11/22.
//  Copyright © 2022 bilibili. All rights reserved.
//

#import "IJKLogMetric.h"

@implementation IJKLogMetric

- (NSString *)description
{
    return [NSString stringWithFormat:@"%lld,%lld,%lld,%lld,%@,%@", self.timestamp, self.preparedDuration, self.firstVideoLatency, self.timeFromInitUntilView, self.videoUrl, self.videoPlayer];
}

@end

#pragma mark Time

CFTimeInterval MonotonicTimeGetCurrent()
{
    struct timespec t;
    int res = clock_gettime(CLOCK_MONOTONIC, &t);
    if (__builtin_expect(res != noErr, 0)) {
        [NSException raise:NSInternalInconsistencyException format:@"Error in clock_gettime(): %s", strerror(res)];
    }
    return t.tv_sec + t.tv_nsec / (CFTimeInterval)NSEC_PER_SEC;
}
