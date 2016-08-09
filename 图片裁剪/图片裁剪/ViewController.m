//
//  ViewController.m
//  图片裁剪
//
//  Created by niuwan on 16/7/24.
//  Copyright © 2016年 niuwan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载图片
    UIImage *image = [UIImage imageNamed: @"阿狸头像"];
    
    CGFloat imageWH = image.size.width;
    
    CGFloat border = 1;
    CGFloat clipWH = imageWH + 2 * border;
    //图片上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(clipWH, clipWH), NO, 0);
    
    //大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, clipWH, clipWH)];
    
    [[UIColor blueColor] set];
    
    [path fill];
    
    //图片
    UIBezierPath *imagePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, imageWH, imageWH)];
    
    [imagePath addClip];
    
    [image drawAtPoint:CGPointMake(border, border)];
    
    UIImage *getImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    _imageView.image = getImage;
    
    
}

- (void)clipImage {

    //加载图片
    UIImage *image = [UIImage imageNamed: @"阿狸头像"];
    
    //图片上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    //裁剪路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    [path addClip];
    
    //绘制图片
    [image drawAtPoint:CGPointZero];
    
    //获取图片
    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭
    UIGraphicsEndImageContext();
    
    _imageView.image = clipImage;
}

@end
