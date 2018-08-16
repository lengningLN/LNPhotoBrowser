//
//  LNPhotoCell.h
//  LNPhotoBrower
//
//  Created by 刘宁 on 2018/8/16.
//  Copyright © 2018年 刘宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LNPhotoBrowser;
@interface LNPhotoCell : UICollectionViewCell
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) UIImage *placeHolderImage;
@property (nonatomic, weak) UIImageView *sourceView;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, weak) LNPhotoBrowser *browser;
@property (nonatomic, weak, readonly) UIImageView *imageView;

@end
