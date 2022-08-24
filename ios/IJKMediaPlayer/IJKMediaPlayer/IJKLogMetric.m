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
    return [NSString stringWithFormat:@"%lld,%lld,%lld,%@,%@", self.timestamp, self.preparedDuration, self.firstVideoLatency, self.videoUrl, self.videoPlayer];
}

@end
