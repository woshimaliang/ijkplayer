//
//  IJKVideoGridViewController.h
//  IJKMediaDemo
//
//  Created by Matt Mo on 8/26/22.
//  Copyright © 2022 bilibili. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum IJKVideoGridType {
    IJKVideoGridType_GridViewFourIJK = 0,
    IJKVideoGridType_GridViewAVPlayerIJKSideBySide   = 1,
    IJKVideoGridType_FullPageIJK    = 2,
} IJKVideoGridType;

@interface IJKVideoGridViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

- (instancetype)initWithURL:(NSURL *)url withState:(IJKVideoGridType)type;

@end

NS_ASSUME_NONNULL_END
