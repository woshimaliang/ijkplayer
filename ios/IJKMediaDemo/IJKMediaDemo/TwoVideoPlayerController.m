//
//  TwoVideoPlayerController.m
//  IJKMediaDemo
//
//  Created by Matt Mo on 8/25/22.
//  Copyright © 2022 bilibili. All rights reserved.
//

#import "TwoVideoPlayerController.h"
#import "IJKMoviePlayerViewController.h"

@interface TwoVideoPlayerController ()

@property NSURL *url;
@property UIView *topContainerView;
@property UIView *bottomContainerView;
@property UIViewController* topController;
@property UIViewController* bottomController;
@property NSArray<NSLayoutConstraint*>* landscapeConstraints;
@property NSArray<NSLayoutConstraint*>* portraitConstraints;

@end

@implementation TwoVideoPlayerController

CFTimeInterval MonotonicTimeGetCurrent2()
{
    struct timespec t;
    int res = clock_gettime(CLOCK_MONOTONIC, &t);
    if (__builtin_expect(res != noErr, 0)) {
        [NSException raise:NSInternalInconsistencyException format:@"Error in clock_gettime(): %s", strerror(res)];
    }
    return t.tv_sec + t.tv_nsec / (CFTimeInterval)NSEC_PER_SEC;
}

- (void)setupConstraints
{
    self.landscapeConstraints = @[
        [self.topContainerView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.topContainerView.trailingAnchor constraintEqualToAnchor:self.bottomContainerView.leadingAnchor],
        [self.topContainerView.topAnchor constraintEqualToAnchor:self.topLayoutGuide.topAnchor],
        [self.topContainerView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [self.bottomContainerView.leadingAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.bottomContainerView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.bottomContainerView.topAnchor constraintEqualToAnchor:self.topLayoutGuide.topAnchor],
        [self.bottomContainerView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
    ];
    
    self.portraitConstraints = @[
        [self.topContainerView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.topContainerView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.topContainerView.topAnchor constraintEqualToAnchor:self.topLayoutGuide.topAnchor],
        [self.topContainerView.bottomAnchor constraintEqualToAnchor:self.bottomContainerView.topAnchor],
        [self.bottomContainerView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.bottomContainerView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.bottomContainerView.topAnchor constraintEqualToAnchor:self.view.centerYAnchor],
        [self.bottomContainerView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
    ];
}

- (instancetype)initWithURL:(NSURL *)url
{
    self = [super init];
    if (self) {
        self.url = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:NO];
    // Do any additional setup after loading the view.
    
    CGRect topFrame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2.);
    UIView *topContainerView = [[UIView alloc] initWithFrame:topFrame];
    topContainerView.backgroundColor = UIColor.blueColor;
    CGRect bottomFrame = CGRectMake(0, CGRectGetMaxY(topFrame), self.view.frame.size.width, self.view.frame.size.height/2.);
    UIView *bottomContainerView = [[UIView alloc] initWithFrame:bottomFrame];
    bottomContainerView.backgroundColor = UIColor.redColor;
    self.topContainerView = topContainerView;
    self.bottomContainerView = bottomContainerView;
    [self.view addSubview:topContainerView];
    [self.view addSubview:bottomContainerView];
    
    self.topContainerView.translatesAutoresizingMaskIntoConstraints = false;
    self.bottomContainerView.translatesAutoresizingMaskIntoConstraints = false;
    
    CFTimeInterval topControllerAllocStart = MonotonicTimeGetCurrent2();
    self.topController = [[IJKVideoViewController alloc] initWithURL:self.url useIJKPlayer:NO];
    CFTimeInterval topControllerAllocEnd = MonotonicTimeGetCurrent2();
    CFTimeInterval bottomControllerAllocStart = MonotonicTimeGetCurrent2();
    self.bottomController = [[IJKVideoViewController alloc] initWithURL:self.url useIJKPlayer:YES];
    CFTimeInterval bottomControllerAllocEnd = MonotonicTimeGetCurrent2();
    
    CFTimeInterval topControllerAddViewControllerStart = MonotonicTimeGetCurrent2();
    [self addChildViewController:self.topController];
    [self.topContainerView addSubview:self.topController.view];
    [self.topController didMoveToParentViewController:self];
    CFTimeInterval topControllerAddViewControllerEnd = MonotonicTimeGetCurrent2();
    
    CFTimeInterval bottomControllerAddViewControllerStart = MonotonicTimeGetCurrent2();
    [self addChildViewController:self.bottomController];
    [self.bottomContainerView addSubview:self.bottomController.view];
    [self.bottomController didMoveToParentViewController:self];
    CFTimeInterval bottomControllerAddViewControllerEnd = MonotonicTimeGetCurrent2();
    [self setupConstraints];
    
    NSLog(@"topControllerAllocStart: %f", topControllerAllocStart);
    NSLog(@"topControllerAllocEnd: %f", topControllerAllocEnd);
    NSLog(@"bottomControllerAllocStart: %f", bottomControllerAllocStart);
    NSLog(@"bottomControllerAllocEnd: %f", bottomControllerAllocEnd);
    
    NSLog(@"topControllerAddViewControllerStart: %f", topControllerAddViewControllerStart);
    NSLog(@"topControllerAddViewControllerEnd: %f", topControllerAddViewControllerEnd);
    NSLog(@"bottomControllerAddViewControllerStart: %f", bottomControllerAddViewControllerStart);
    NSLog(@"bottomControllerAddViewControllerEnd: %f", bottomControllerAddViewControllerEnd);
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    [self handleOrientation:orientation];
}

- (void)handleOrientation:(UIInterfaceOrientation) orientation
{
    NSArray<NSLayoutConstraint *> * oldConstraints = nil;
    NSArray<NSLayoutConstraint *> * newConstraints = nil;
    if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight) {
        oldConstraints = self.portraitConstraints;
        newConstraints = self.landscapeConstraints;
    } else {
        oldConstraints = self.landscapeConstraints;
        newConstraints = self.portraitConstraints;
    }
    [self.view removeConstraints:oldConstraints];
    [self.view addConstraints:newConstraints];
    [NSLayoutConstraint activateConstraints:newConstraints];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
