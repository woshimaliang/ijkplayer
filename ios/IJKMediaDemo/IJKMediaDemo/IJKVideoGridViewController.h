//
//  IJKVideoGridViewController.h
//  IJKMediaDemo
//
//  Created by Matt Mo on 8/26/22.
//  Copyright © 2022 bilibili. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IJKVideoGridViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

- (instancetype)initWithURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
