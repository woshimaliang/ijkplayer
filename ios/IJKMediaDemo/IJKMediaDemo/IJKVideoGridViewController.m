//
//  IJKVideoGridViewController.m
//  IJKMediaDemo
//
//  Created by Matt Mo on 8/26/22.
//  Copyright © 2022 bilibili. All rights reserved.
//

#import "IJKVideoGridViewController.h"
#import "IJKVideoCollectionViewCell.h"

@interface IJKVideoGridViewController ()

@property UICollectionView* collectionView;
@property UICollectionViewFlowLayout* flowLayout;
@property NSURL* url;

@end

@implementation IJKVideoGridViewController

- (instancetype)initWithURL:(NSURL *)url
{
    self = [super init];
    if (self) {
#if IOS_SIMULATOR
        self.url = [NSURL URLWithString:@"https://v1.pinimg.com/videos/mc/720p/a9/44/c7/a944c799036feb7baf2beeef4fe277a4.mp4"];
#else
        self.url = url;
#endif
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.flowLayout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:IJKVideoCollectionViewCell.class forCellWithReuseIdentifier:IJKVideoCollectionViewCell.reuseIdentifier];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IJKVideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:IJKVideoCollectionViewCell.reuseIdentifier forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    IJKVideoCollectionViewCell *videoCell = (IJKVideoCollectionViewCell *)cell;
    NSURL *url = nil;
    if ([videoCell.url.absoluteString isEqualToString:@"https://v1.pinimg.com/videos/mc/720p/a9/44/c7/a944c799036feb7baf2beeef4fe277a4.mp4"]) {
        url = [NSURL URLWithString:@"https://v1.pinimg.com/videos/mc/720p/bd/7c/09/bd7c09f21a7312833d8e95ca07a1d471.mp4"];
    } else {
        url = [NSURL URLWithString:@"https://v1.pinimg.com/videos/mc/720p/a9/44/c7/a944c799036feb7baf2beeef4fe277a4.mp4"];
    }
    [videoCell loadVideo:url useIJKPlayer:YES];
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    IJKVideoCollectionViewCell *videoCell = (IJKVideoCollectionViewCell *)cell;
    [videoCell clear];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
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
