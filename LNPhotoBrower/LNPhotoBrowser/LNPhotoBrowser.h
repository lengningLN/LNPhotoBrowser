//
//  LNPhotoBrowser.h
//  LNPhotoBrower
//
//  Created by 刘宁 on 2018/8/16.
//  Copyright © 2018年 刘宁. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LNAnimationTypeScale,
    LNAnimationTypePush
} LNAnimationType;

@class LNPhotoBrowser;
@protocol LNPhotoBrowserDelegate <NSObject>

/**
 图片的个数
 */
- (NSInteger)numberOfPhotosInPhotoBrowser:(LNPhotoBrowser *)photoBrowser;

/**
 图片的URL
 支持本地和远程两种URL
 */
- (NSURL *)photoBrowser:(LNPhotoBrowser *)photoBrowser imageURLForIndex:(NSInteger)index;

/**
 设置占位图片
 @discussion 必须设置，不然在视图没加载出来之前无法显示
 */
- (UIImage *)photoBrowser:(LNPhotoBrowser *)photoBrowser placeholderImageForIndex:(NSInteger)index;

@optional

/**
 如果需要缩放弹出 需要提供原来的view视图
 */
- (UIImageView *)photoBrowser:(LNPhotoBrowser *)photoBrowser sourceViewForIndex:(NSInteger)index;

@end

@interface LNPhotoBrowser : UIViewController

/**
 提供数据的代理
 */
@property (nonatomic, weak) id<LNPhotoBrowserDelegate> delegate;

/**
 当前选中的索引页
 */
@property (nonatomic, assign) NSInteger selectedIndex;

/**
 支持自定义cell 但必须继承LNPhotoCell
 @discussion 添加操作视图等等
 * 注意不支持xib
 */
@property (nonatomic, assign) Class cellClass;

/**
 弹出动画 默认为（LNAnimationTypeScale）缩放
 */
@property (nonatomic, assign) LNAnimationType animationType;

/**
 如果animationType设置为LNAnimationTypePush时，viewController必须有navigationCotnroller才可以
 */
- (void)showWithViewController:(UIViewController *)viewController;


@end
