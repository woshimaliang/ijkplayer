/*
 * Copyright (C) 2015 Gdier
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

#import "IJKDemoInputURLViewController.h"
#import "IJKMoviePlayerViewController.h"
#import "TwoVideoPlayerController.h"
#import "IJKVideoGridViewController.h"

@interface IJKDemoInputURLViewController () <UITextViewDelegate>

@property(nonatomic,strong) IBOutlet UITextView *textView;
@property NSInteger testState;

@end

@implementation IJKDemoInputURLViewController

- (instancetype)initForSplitView {
    IJKDemoInputURLViewController *splitSelf = [self init];
    splitSelf.testState = 1;
    return splitSelf;
}

- (instancetype)initForGridView {
    IJKDemoInputURLViewController *splitSelf = [self init];
    splitSelf.testState = 2;
    return splitSelf;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"Input URL";
        
        [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Play" style:UIBarButtonItemStyleDone target:self action:@selector(onClickPlayButton)]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)onClickPlayButton {
    if (self.navigationController.topViewController != self) {
        return;
    }
    NSURL *url = [NSURL URLWithString:self.textView.text];
    
    UIViewController *videoController = nil;
    
    switch (self.testState) {
        case 0:
            videoController = [[IJKVideoViewController alloc] initWithURL:url];
            break;
        case 1:
            videoController = [[TwoVideoPlayerController alloc] initWithURL:url];
            break;
        case 2:
            videoController = [[IJKVideoGridViewController alloc] initWithURL:url];
            break;
    }
     
    [self.navigationController pushViewController:videoController animated:YES];
}

@end
