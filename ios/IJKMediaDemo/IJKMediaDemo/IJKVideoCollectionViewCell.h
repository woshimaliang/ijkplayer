//
//  IJKVideoCollectionViewCell.h
//  IJKMediaDemo
//
//  Created by Matt Mo on 8/26/22.
//  Copyright © 2022 bilibili. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface IJKVideoCollectionViewCell : UICollectionViewCell

@property (nonatomic, readonly) NSURL *url;

+ (NSString *)reuseIdentifier;
- (void)clear;
- (void)loadVideo:(NSURL *)url useIJKPlayer:(BOOL)useIJKPlayer;

@end

NS_ASSUME_NONNULL_END
