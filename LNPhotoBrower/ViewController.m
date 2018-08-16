//
//  ViewController.m
//  LNPhotoBrower
//
//  Created by 刘宁 on 2018/8/16.
//  Copyright © 2018年 刘宁. All rights reserved.
//

#import "ViewController.h"
#import "LNCollectionViewCell.h"
#import "LNPhotoBrowser.h"
#import "LNPhotoCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,LNPhotoBrowserDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.flowLayout.minimumInteritemSpacing = 20;
    self.flowLayout.minimumLineSpacing = 20;
    self.flowLayout.itemSize = CGSizeMake(100, 100);
    
    UINib *nib = [UINib nibWithNibName:@"LNCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"LNCollectionViewCell"];
    
    for (int i = 0; i < 7; i++) {
        self.dataSource[i] = @(i);
    }
    [self.collectionView reloadData];
}


#pragma mark - UICollectionViewDelegate & UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LNCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LNCollectionViewCell" forIndexPath:indexPath];
    NSString *name = [NSString stringWithFormat:@"%@.jpg",self.dataSource[indexPath.row]];
    cell.imageView.image = [UIImage imageNamed:name];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LNPhotoBrowser *browser = [[LNPhotoBrowser alloc] init];
    browser.delegate = self;
    browser.cellClass = [LNPhotoCell class];
    browser.selectedIndex = indexPath.row;
    [browser showWithViewController:self];
}


/**
 图片的个数
 */
- (NSInteger)numberOfPhotosInPhotoBrowser:(LNPhotoBrowser *)photoBrowser
{
    return self.dataSource.count;
}

/**
 图片的URL
 支持本地和远程两种URL
 */
- (NSURL *)photoBrowser:(LNPhotoBrowser *)photoBrowser imageURLForIndex:(NSInteger)index
{
    NSString *string = [[NSBundle mainBundle]pathForResource:[self.dataSource[index] stringValue] ofType:@"jpg"];
    return [NSURL fileURLWithPath:string];
}

/**
 设置占位图片
 @discussion 必须设置，不然在视图没加载出来之前无法显示
 */
- (UIImage *)photoBrowser:(LNPhotoBrowser *)photoBrowser placeholderImageForIndex:(NSInteger)index;
{
    NSString *name = [NSString stringWithFormat:@"%@.jpg",[self.dataSource[index] stringValue]];
    
    return [UIImage imageNamed:name];
}


/**
 如果需要缩放弹出 需要提供原来的view视图
 */
- (UIImageView *)photoBrowser:(LNPhotoBrowser *)photoBrowser sourceViewForIndex:(NSInteger)index
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    LNCollectionViewCell *cell = (LNCollectionViewCell*)[self.collectionView cellForItemAtIndexPath:indexPath];
    return cell.imageView;
}


@end
