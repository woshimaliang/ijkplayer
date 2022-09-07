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
@property IJKTestState testState;

@end

@implementation IJKDemoInputURLViewController

- (instancetype)initWithTestState:(IJKTestState)testState {
    IJKDemoInputURLViewController *variation = [self init];
    variation.testState = testState;
    return variation;
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
        case IJKTestState_Default: {
            videoController = [[IJKVideoViewController alloc] initWithURL:url];
            break;
        }
        case IJKTestState_SplitView: {
            videoController = [[TwoVideoPlayerController alloc] initWithURL:url];
            break;
        }
        case IJKTestState_GridViewFourIJK: {
            videoController = [[IJKVideoGridViewController alloc] initWithURL:url withState:IJKVideoGridType_GridViewFourIJK];
            break;
        }
        case IJKTestState_GridViewAVPlayerIJKSideBySide: {
            videoController = [[IJKVideoGridViewController alloc] initWithURL:url withState:IJKVideoGridType_GridViewAVPlayerIJKSideBySide];
            break;
        }
        case IJKTestState_FullPageIJK: {
            videoController = [[IJKVideoGridViewController alloc] initWithURL:url withState:IJKVideoGridType_FullPageIJK];
            break;
        }
    }
     
    [self.navigationController pushViewController:videoController animated:YES];
}

@end
