/*
 * Copyright (C) 2013-2015 Bilibili
 * Copyright (C) 2013-2015 Zhang Rui <bbcallen@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "IJKAppDelegate.h"
#import "IJKDemoMainViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>

@interface IJKAppDelegate()

@property (nonatomic) NSTimeInterval startTime;

@end

@implementation IJKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.startTime = [[NSDate date] timeIntervalSince1970];
    self.metrics = [[NSMutableArray alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[IJKDemoMainViewController alloc] init]];
    
    self.viewController = navigationController;
    self.window.rootViewController = self.viewController;

    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)recordMetrics
{
    NSMutableArray *metrics = self.metrics;
    
    NSString *metricsLogs = @"";
    for (IJKLogMetric* metric in metrics) {
        NSString *metricLine = [metric description];
        NSLog(@"mmo: metricLine: %@", metricLine);
        if (metricsLogs.length == 0) {
            NSLog(@"mmo: first line");
            NSString *newString = [NSString stringWithFormat:@"%@\n", metricLine];
            metricsLogs = newString;
        } else {
            NSLog(@"mmo: all other lines");
            NSString *newString = [NSString stringWithFormat:@"%@%@\n", metricsLogs, metricLine];
            metricsLogs = newString;
        }
    }
    NSLog(@"mmo: self.startTime: %f", self.startTime);
    NSLog(@"mmo: metricsLogs:\n%@", metricsLogs);
    
    if (metricsLogs.length > 0) {
        NSData *content = [metricsLogs dataUsingEncoding:NSUTF8StringEncoding];
        
        NSString *newMetricFile = [NSString stringWithFormat:@"ijk-logs-%f.txt", self.startTime];
        NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        NSString *newFilePath = [documentsDirectory stringByAppendingPathComponent:newMetricFile];
        
        BOOL createFileSuccess = [NSFileManager.defaultManager createFileAtPath:newFilePath contents:content attributes:nil];
        if (!createFileSuccess) {
            NSLog(@"File cannot be created");
        } else {
            NSLog(@"Created new file: %@", newFilePath);
        }
    }


//    NSError *writeFileError = nil;
//    BOOL writeFileSuccess = [metricsLogs writeToFile:newFilePath
//                                          atomically:NO
//                                            encoding:NSStringEncodingConversionAllowLossy
//                                               error:&writeFileError];
//    if (!writeFileSuccess) {
//        NSLog(@"Failed to write to file. %@", writeFileError);
//    }

}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self recordMetrics];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
