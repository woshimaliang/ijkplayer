//
//  IJKLogMetric.h
//  IJKMediaPlayer
//
//  Created by Matt Mo on 8/11/22.
//  Copyright © 2022 bilibili. All rights reserved.
//

#import <Foundation/Foundation.h>

CFTimeInterval MonotonicTimeGetCurrent();

@interface IJKLogMetric : NSObject
@property int64_t timestamp;
@property int64_t preparedDuration;
@property int64_t firstVideoLatency;
@property bool isWarm;
@property NSString *videoUrl;
@property NSString *videoPlayer;

@end

@protocol IJKLogMetricDelegate <NSObject>

- (void)didLogSession:(IJKLogMetric *)metric;

@end
