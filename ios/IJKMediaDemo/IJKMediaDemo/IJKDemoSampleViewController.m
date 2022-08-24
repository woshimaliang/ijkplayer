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

#import "IJKDemoSampleViewController.h"

#import "IJKCommon.h"
#import "IJKMoviePlayerViewController.h"

@interface IJKDemoSampleViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic,strong) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSArray *sampleList;

@end

@implementation IJKDemoSampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"M3U8";

    NSURL *sampleHLS = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"m3u8"];
    NSMutableArray *sampleList = [[NSMutableArray alloc] init];

    [sampleList addObject:@[@"las url",
    @"{\"version\":\"1.0.0\",\"adaptationSet\":[{\"duration\":1000,\"id\":1,\"representation\":[{\"id\":1,\"codec\":\"avc1.64001e,mp4a.40.5\",\"url\":\"http://las-tech.org.cn/kwai/las-test_ld500d.flv\",\"backupUrl\":[],\"host\":\"las-tech.org.cn\",\"maxBitrate\":700,\"width\":640,\"height\":360,\"frameRate\":25,\"qualityType\":\"SMOOTH\",\"qualityTypeName\":\"流畅\",\"hidden\":false,\"disabledFromAdaptive\":false,\"defaultSelected\":false},{\"id\":2,\"codec\":\"avc1.64001f,mp4a.40.5\",\"url\":\"http://las-tech.org.cn/kwai/las-test_sd1000d.flv\",\"backupUrl\":[],\"host\":\"las-tech.org.cn\",\"maxBitrate\":1300,\"width\":960,\"height\":540,\"frameRate\":25,\"qualityType\":\"STANDARD\",\"qualityTypeName\":\"标清\",\"hidden\":false,\"disabledFromAdaptive\":false,\"defaultSelected\":true},{\"id\":3,\"codec\":\"avc1.64001f,mp4a.40.5\",\"url\":\"http://las-tech.org.cn/kwai/las-test.flv\",\"backupUrl\":[],\"host\":\"las-tech.org.cn\",\"maxBitrate\":2300,\"width\":1280,\"height\":720,\"frameRate\":30,\"qualityType\":\"HIGH\",\"qualityTypeName\":\"高清\",\"hidden\":false,\"disabledFromAdaptive\":false,\"defaultSelected\":false}]}]}"]];
    
    [sampleList addObject:@[@"Pinterest HLS local 240 first 230668812537517571",
                            sampleHLS.absoluteString]];
    [sampleList addObject:@[@"AVPlayer QR code mp4 1104718983571535565", @"https://v.pinimg.com/videos/mc/720p/bd/7c/09/bd7c09f21a7312833d8e95ca07a1d471.mp4"]];
    [sampleList addObject:@[@"ijk QR code mp4 1104718983571535565", @"https://v.pinimg.com/videos/mc/720p/bd/7c/09/bd7c09f21a7312833d8e95ca07a1d471.mp4"]];
    [sampleList addObject:@[@"AVPlayer QR code HLS 1104718983571535565", @"https://v.pinimg.com/    videos/mc/hls/bd/7c/09/bd7c09f21a7312833d8e95ca07a1d471.m3u8"]];
    [sampleList addObject:@[@"ijk QR code HLS 1104718983571535565", @"https://v.pinimg.com/    videos/mc/hls/bd/7c/09/bd7c09f21a7312833d8e95ca07a1d471.m3u8"
]];
    [sampleList addObject:@[@"ijkplayer mp4 230668812537517571 Pinterest",
                            @"https://v.pinimg.com/videos/mc/720p/8f/fc/aa/8ffcaaf8580fcb67f71a1faafdd3ab39.mp4"]];
    [sampleList addObject:@[@"AVPlayer mp4 Pinterest 230668812537517571",
                            @"https://v.pinimg.com/videos/mc/720p/8f/fc/aa/8ffcaaf8580fcb67f71a1faafdd3ab39.mp4"]];
    [sampleList addObject:@[@"AVPlayer HLS Pinterest 230668812537517571",
                            @"https://v.pinimg.com/videos/mc/hls/8f/fc/aa/8ffcaaf8580fcb67f71a1faafdd3ab39.m3u8"]];
    [sampleList addObject:@[@"Pinterest HLS 230668812537517571",
                            @"https://v.pinimg.com/videos/mc/hls/8f/fc/aa/8ffcaaf8580fcb67f71a1faafdd3ab39.m3u8"]];
    [sampleList addObject:@[@"Pinterest 720 230668812537517571",
                            @"https://v.pinimg.com/videos/mc/hls/8f/fc/aa/8ffcaaf8580fcb67f71a1faafdd3ab39_720w.m3u8"]];
    [sampleList addObject:@[@"Pinterest 240 230668812537517571",
                            @"https://v.pinimg.com/videos/mc/hls/8f/fc/aa/8ffcaaf8580fcb67f71a1faafdd3ab39_240w.m3u8"]];
    [sampleList addObject:@[@"ijkplayer Pinterest 1080 mp4",
                            @"https://v1.pinimg.com/nickd/videos/big_buck_bunny_1080.mp4"]];
    [sampleList addObject:@[@"AVPlayer Pinterest 1080 mp4",
                            @"https://v1.pinimg.com/nickd/videos/big_buck_bunny_1080.mp4"]];
    [sampleList addObject:@[@"Pinterest HLS 40s e8206527e1a1200fa6d5f9c19be189be_mobile",
                            @"https://v.pinimg.com/videos/v2/hls/e8/20/65/e8206527e1a1200fa6d5f9c19be189be_mobile.m3u8"]];
    [sampleList addObject:@[@"Pinterest HLS 40s e8206527e1a1200fa6d5f9c19be189be",
                            @"https://v.pinimg.com/videos/hls/e8/20/65/e8206527e1a1200fa6d5f9c19be189be.m3u8"]];
    [sampleList addObject:@[@"Pinterest h265 0236103b8b0d799ccc9592bca3ad924d",
                            @"https://v.pinimg.com/videos/mc/h265/02/36/10/0236103b8b0d799ccc9592bca3ad924d.m3u8"]];
    [sampleList addObject:@[@"Pinterest hls a944c799036feb7baf2beeef4fe277a4",
                            @"https://v1.pinimg.com/videos/mc/hls/a9/44/c7/a944c799036feb7baf2beeef4fe277a4.m3u8"]];
    [sampleList addObject:@[@"ijkplayer Pinterest mp4 a944c799036feb7baf2beeef4fe277a4",
                            @"https://v1.pinimg.com/videos/mc/720p/a9/44/c7/a944c799036feb7baf2beeef4fe277a4.mp4"]];
    [sampleList addObject:@[@"AVPlayer Pinterest mp4 a944c799036feb7baf2beeef4fe277a4",
                            @"https://v1.pinimg.com/videos/mc/720p/a9/44/c7/a944c799036feb7baf2beeef4fe277a4.mp4"]];
    [sampleList addObject:@[@"AVPlayer Pinterest HLS 40s e8206527e1a1200fa6d5f9c19be189be_mobile",
                            @"https://v.pinimg.com/videos/v2/hls/e8/20/65/e8206527e1a1200fa6d5f9c19be189be_mobile.m3u8"]];

    [sampleList addObject:@[@"bipbop basic master playlist",
                            @"http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/bipbop_4x3_variant.m3u8"]];
    [sampleList addObject:@[@"bipbop basic 400x300 @ 232 kbps",
                            @"http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/gear1/prog_index.m3u8"]];
    [sampleList addObject:@[@"bipbop basic 640x480 @ 650 kbps",
                            @"http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/gear2/prog_index.m3u8"]];
    [sampleList addObject:@[@"bipbop basic 640x480 @ 1 Mbps",
                            @"http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/gear3/prog_index.m3u8"]];
    [sampleList addObject:@[@"bipbop basic 960x720 @ 2 Mbps",
                            @"http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/gear4/prog_index.m3u8"]];
    [sampleList addObject:@[@"bipbop basic 22.050Hz stereo @ 40 kbps",
                            @"http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/gear0/prog_index.m3u8"]];

    [sampleList addObject:@[@"bipbop advanced master playlist",
                            @"http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8"]];
    [sampleList addObject:@[@"bipbop advanced 416x234 @ 265 kbps",
                            @"http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_16x9/gear1/prog_index.m3u8"]];
    [sampleList addObject:@[@"bipbop advanced 640x360 @ 580 kbps",
                            @"http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_16x9/gear2/prog_index.m3u8"]];
    [sampleList addObject:@[@"bipbop advanced 960x540 @ 910 kbps",
                            @"http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_16x9/gear3/prog_index.m3u8"]];
    [sampleList addObject:@[@"bipbop advanced 1280x720 @ 1 Mbps",
                            @"http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_16x9/gear4/prog_index.m3u8"]];
    [sampleList addObject:@[@"bipbop advanced 1920x1080 @ 2 Mbps",
                            @"http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_16x9/gear5/prog_index.m3u8"]];
    [sampleList addObject:@[@"bipbop advanced 22.050Hz stereo @ 40 kbps",
                            @"http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_16x9/gear0/prog_index.m3u8"]];


    self.sampleList = sampleList;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Samples";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (IOS_NEWER_OR_EQUAL_TO_7) {
        return self.sampleList.count;
    } else {
        return self.sampleList.count - 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"abc"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"abc"];
        cell.textLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    }

    cell.textLabel.text = self.sampleList[indexPath.row][0];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    NSArray *item = self.sampleList[indexPath.row];
    NSString *title = item[0];
    NSString *url_str = item[1];
    
    if ([url_str containsString:@"adaptationSet"]) {
        [self.navigationController presentViewController:[[IJKVideoViewController alloc] initWithManifest:url_str] animated:YES completion:^{}];
    } else{
        NSURL   *url  = [NSURL URLWithString:item[1]];
        BOOL useIJKPlayer = ![title containsString:@"AVPlayer"];
        [self.navigationController presentViewController:[[IJKVideoViewController alloc] initWithURL:url useIJKPlayer:useIJKPlayer] animated:YES completion:^{}];
    }
}

@end
