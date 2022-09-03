//
//  IJKVideoCollectionViewCell.m
//  IJKMediaDemo
//
//  Created by Matt Mo on 8/26/22.
//  Copyright © 2022 bilibili. All rights reserved.
//

#import "IJKVideoCollectionViewCell.h"
#import "IJKMoviePlayerViewController.h"
#import "IJKMediaControl.h"
#include <stdlib.h>

@interface IJKVideoCollectionViewCell()

@property IJKVideoViewController *videoVC;
@property (nonatomic, readwrite) NSURL *url;
@property NSArray<NSLayoutConstraint*>* portraitConstraints;
@property NSArray<NSLayoutConstraint*>* landscapeConstraints;
@end

@implementation IJKVideoCollectionViewCell

+ (NSString *)reuseIdentifier
{
    return @"videoCell";
}

- (void)loadVideo:(NSURL *)url useIJKPlayer:(BOOL)useIJKPlayer
{
    if (self.videoVC == nil) {
        self.url = url;
        self.videoVC = [[IJKVideoViewController alloc] initWithURL:url useIJKPlayer:useIJKPlayer];
        [self addSubview:self.videoVC.view];
        [self setupLayoutConstraints];
    } else {
        self.url = url;
        [self.videoVC switchURL:url];
    }
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    [self clear];
}

- (void)clear
{
    [self.videoVC.player stop];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)setupLayoutConstraints
{
    self.videoVC.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitConstraints = @[
        [self.videoVC.view.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.videoVC.view.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [self.videoVC.view.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.videoVC.view.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
    ];
    [NSLayoutConstraint activateConstraints:self.portraitConstraints];
}

@end
