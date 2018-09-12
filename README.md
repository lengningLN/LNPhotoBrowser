# LNPhotoBrowser
一套友好的、方便集成的针对图片浏览框架！
实现一个类似微信朋友圈中图片浏览的框架。

# 本次优化
1. 添加底部图片页数指示
2. 图片之间添加间隔
3. 添加下滑关闭
4. 添加拖动变小，背景变化



# Interduce 【简单介绍】
- 友好不影响原有项目结构
- 支持微信朋友圈图片浏览时的所有操作



# Features【能做什么】
 - [x] 点击实现图片放大，并加载所有需要显示的图片
 - [x] 支持缩放
 - [x] 支持左滑、右滑浏览大图
 - [x] 支持拖拽
 - [x] 支持下滑到一定位置缩小并回到原图
 - [x] 支持背景渐变
 - [ ] 支持旋转
 
# 目前存在的问题
1. 不支持缩放
2. 极端情况细节的处理不够完美

# Class【使用到的类】
1. LNPhotoBrowser   
2. LNPhotoCell
3. LNLoadingView


# Getting Started【开始使用】

## 效果演示


## 文字介绍
- 把LNPhotoBrowser类拖进工程中，注意依赖<SDWebImage>框架
- 继承<LNPhotoCell>，根据具体的需求，在大图浏览时加入响应的功能
- 在图片点击的地方，创建LNPhotoBrowser对象，赋值相应的属性即可
- 接受<LNPhotoBrowserDelegate>
- 根据需要实现对应的协议方法

## 代码介绍
- 再点击图片的位置的设置
```
LNPhotoBrowser *browser = [[LNPhotoBrowser alloc] init];
    browser.delegate = self;
    browser.cellClass = [LNPhotoCell class];
    browser.selectedIndex = indexPath.row;
    [browser showWithViewController:self];
}
```

- 需要实现的数据协议
```

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

/**
 如果需要缩放弹出 需要提供原来的view视图
 */
- (UIImageView *)photoBrowser:(LNPhotoBrowser *)photoBrowser sourceViewForIndex:(NSInteger)index;
```




# more about  【更多】
1. 如果有什么问题，请在[issues](https://github.com/lengningLN/LNPhotoBrowser/issues)区域提问，我会抽时间改进。
2. [我的博客](http://lengningln.github.io/)
3. [我的微博](http://weibo.com/liuning185)
### 打赏
![](http://m.qpic.cn/psb?/V11R4JcH0fAdbu/h4vWrizoOlby*zntVMiu.1F9CMMMx2T9BOWUjSEnCE8!/b/dDUBAAAAAAAA&bo=nALQAgAAAAADB24!&rf=viewer_4)

