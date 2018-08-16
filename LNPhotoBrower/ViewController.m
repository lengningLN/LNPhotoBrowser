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
#import "UIImageView+WebCache.h"

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
    
    //本地图片
//    for (int i = 0; i < 7; i++) {
//        self.dataSource[i] = @(i);
//    }
    
    //网络图片
    self.dataSource[0] = @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=170467806,1583061927&fm=173&app=25&f=JPEG?w=550&h=309&s=9E141CCE871024770FFC962903007041";
    self.dataSource[1] = @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=410742347,4159915112&fm=173&app=25&f=JPEG?w=580&h=412&s=33A1D805081207D88C149DA303006001";
    self.dataSource[2] = @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=227601010,1752783549&fm=173&app=25&f=JPEG?w=580&h=606&s=ED079557CAF30DBD2614E1A20300F040";
    self.dataSource[3] = @"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=98103306,3825292050&fm=15&gp=0.jpg";
    self.dataSource[4] = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1534416129867&di=021145b6c82a95d5fc0fd603c29d96e9&imgtype=jpg&src=http%3A%2F%2Fimg3.imgtn.bdimg.com%2Fit%2Fu%3D1539154028%2C2259069525%26fm%3D214%26gp%3D0.jpg";
    self.dataSource[5] = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1534416116808&di=bb4f879377b8c472ceaae9e1e73dc662&imgtype=0&src=http%3A%2F%2Fimg.19196.com%2Fuploads%2F151126%2F9-151126095P51b.jpg";
    self.dataSource[6] = @"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2798038485,1098783002&fm=15&gp=0.jpg";
    self.dataSource[7] = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1534416156385&di=bc0668e38d6efaa792fc835488f553b7&imgtype=jpg&src=http%3A%2F%2Fimg4.imgtn.bdimg.com%2Fit%2Fu%3D1798863369%2C2650549000%26fm%3D214%26gp%3D0.jpg";
    self.dataSource[8] = @"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2711644284,4114963897&fm=15&gp=0.jpg";
    self.dataSource[9] = @"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4113742554,2651567125&fm=15&gp=0.jpg";
    self.dataSource[10] = @"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3712780851,1879285617&fm=15&gp=0.jpg";
    self.dataSource[11] = @"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2253196755,2730366453&fm=15&gp=0.jpg";
    
    [self.collectionView reloadData];
}


#pragma mark - UICollectionViewDelegate & UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LNCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LNCollectionViewCell" forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.dataSource[indexPath.row]]];
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
    return [NSURL URLWithString:self.dataSource[index]];
}

/**
 设置占位图片
 @discussion 必须设置，不然在视图没加载出来之前无法显示
 */
- (UIImage *)photoBrowser:(LNPhotoBrowser *)photoBrowser placeholderImageForIndex:(NSInteger)index;
{
    NSString *name = [NSString stringWithFormat:@"%zd.jpg",index%7];
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
