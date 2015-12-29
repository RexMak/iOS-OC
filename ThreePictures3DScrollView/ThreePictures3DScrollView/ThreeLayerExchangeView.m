//
//  ThreeLayerExchangeView.m
//  ThreePictures3DScrollView
//
//  Created by Ibokan1 on 15/12/29.
//  Copyright © 2015年 rex mak. All rights reserved.
//

#import "ThreeLayerExchangeView.h"

@interface ThreeLayerExchangeView ()
{
    CALayer *layer0;
    CALayer *layer1;
    CALayer *layer2;
    CALayer *layer3;
    
    CGFloat subView_w;
    CGFloat subView_h;
    
    NSMutableArray *imgs;
    int flag;
    int zoom;
    int img;
    int imgCount;
    BOOL clicked;
}
@end

@implementation ThreeLayerExchangeView

- (id)initWithFrame:(CGRect)frame Images:(NSMutableArray *)images {
    if (self = [super initWithFrame:frame]) {
        layer0 = [CALayer layer];
        layer1 = [CALayer layer];
        layer2 = [CALayer layer];
        layer3 = [CALayer layer];
        
        [self.layer addSublayer:layer0];
        [self.layer addSublayer:layer1];
        [self.layer addSublayer:layer2];
        [self.layer addSublayer:layer3];
    }
    
    subView_w = frame.size.width;
    subView_h = frame.size.height;
    
    imgs = images;
    imgCount = (int)imgs.count;
    
    CATransform3D transform = CATransform3DIdentity;
    
    transform.m34 = -1.0/500;
    transform = CATransform3DTranslate(transform, 0, 0, 0);
    
    //    self.layer0.frame = CGRectMake(0, 0, 4, subView_h);
    layer0.position = CGPointMake(frame.size.width/2, frame.size.height/2);
    layer0.backgroundColor = [UIColor cyanColor].CGColor;
    layer0.transform = CATransform3DTranslate(transform, 0, 0, 0);
    
    layer1.frame = CGRectMake(0, 0, subView_w/2, subView_h - 20);
    layer1.position = CGPointMake(frame.size.width/2, frame.size.height/2);
    layer1.contents = (__bridge id _Nullable)([UIImage imageNamed:imgs[0]].CGImage);
    layer1.transform = CATransform3DTranslate(layer0.transform, -subView_w/3, 0, -100);
    
    layer2.frame = CGRectMake(0, 0, subView_w/2, subView_h - 20);
    layer2.position = CGPointMake(frame.size.width/2, frame.size.height/2);
    layer2.contents = (__bridge id _Nullable)([UIImage imageNamed:imgs[1]].CGImage);
    layer2.transform = CATransform3DTranslate(layer0.transform, 0, 0, 100);
    
    layer3.frame = CGRectMake(0, 0, subView_w/2, subView_h - 20);
    layer3.position = CGPointMake(frame.size.width/2, frame.size.height/2);
    layer3.contents = (__bridge id _Nullable)([UIImage imageNamed:imgs[2]].CGImage);
    layer3.transform = CATransform3DTranslate(layer0.transform, subView_w/3, 0, -100);
    
    layer1.transform = CATransform3DRotate(layer1.transform, M_PI_4, 0, 1, 0);
    layer3.transform = CATransform3DRotate(layer3.transform, -M_PI_4, 0, 1, 0);
    
    img = 1;
    flag = 2;
    clicked = YES;
    
    return self;
}

- (void)leftTranslate {
    if (img <= 1) {
        img += imgCount;
    }
    if (flag == 2) {
        layer1.transform = CATransform3DTranslate(layer0.transform, 0, 0, 100);
        layer2.transform = CATransform3DTranslate(layer0.transform, subView_w/3, 0, -100);
        layer2.transform = CATransform3DRotate(layer2.transform, -M_PI_4, 0, 1, 0);
        layer3.transform = CATransform3DTranslate(layer0.transform, -subView_w/3, 0, -100);
        layer3.transform = CATransform3DRotate(layer3.transform, M_PI_4, 0, 1, 0);
        layer3.contents = (__bridge id _Nullable)([UIImage imageNamed:imgs[img-2]].CGImage);
        flag = 1;
        if (!clicked) {
            clicked = YES;
        }
    } else if (flag == 3) {
        layer1.transform = CATransform3DTranslate(layer0.transform, -subView_w/3, 0, -100);
        layer1.transform = CATransform3DRotate(layer1.transform, M_PI_4, 0, 1, 0);
        layer1.contents = (__bridge id _Nullable)([UIImage imageNamed:imgs[img-2]].CGImage);
        layer2.transform = CATransform3DTranslate(layer0.transform, 0, 0, 100);
        layer3.transform = CATransform3DTranslate(layer0.transform, subView_w/3, 0, -100);
        layer3.transform = CATransform3DRotate(layer3.transform, -M_PI_4, 0, 1, 0);
        flag = 2;
        if (!clicked) {
            clicked = YES;
        }
    } else {
        layer1.transform = CATransform3DTranslate(layer0.transform, subView_w/3, 0, -100);
        layer1.transform = CATransform3DRotate(layer1.transform, -M_PI_4, 0, 1, 0);
        layer2.transform = CATransform3DTranslate(layer0.transform, -subView_w/3, 0, -100);
        layer2.transform = CATransform3DRotate(layer2.transform, M_PI_4, 0, 1, 0);
        layer2.contents = (__bridge id _Nullable)([UIImage imageNamed:imgs[img-2]].CGImage);
        layer3.transform = CATransform3DTranslate(layer0.transform, 0, 0, 100);
        flag = 3;
        if (!clicked) {
            clicked = YES;
        }
    }
    img--;
}

- (void)rightTranslate {
    if (img >= imgCount - 2) {
        img -= imgCount;
    }
    if (flag == 2) {
        layer1.transform = CATransform3DTranslate(layer0.transform, subView_w/3, 0, -100);
        layer1.transform = CATransform3DRotate(layer1.transform, -M_PI_4, 0, 1, 0);
        layer1.contents = (__bridge id _Nullable)([UIImage imageNamed:imgs[img+2]].CGImage);
        layer2.transform = CATransform3DTranslate(layer0.transform, -subView_w/3, 0, -100);
        layer2.transform = CATransform3DRotate(layer2.transform, M_PI_4, 0, 1, 0);
        layer3.transform = CATransform3DTranslate(layer0.transform, 0, 0, 100);
        flag = 3;
        if (!clicked) {
            clicked = YES;
        }
    } else if (flag == 3) {
        layer1.transform = CATransform3DTranslate(layer0.transform, 0, 0, 100);
        layer2.transform = CATransform3DTranslate(layer0.transform, subView_w/3, 0, -100);
        layer2.transform = CATransform3DRotate(layer2.transform, -M_PI_4, 0, 1, 0);
        layer2.contents = (__bridge id _Nullable)([UIImage imageNamed:imgs[img+2]].CGImage);
        layer3.transform = CATransform3DTranslate(layer0.transform, -subView_w/3, 0, -100);
        layer3.transform = CATransform3DRotate(layer3.transform, M_PI_4, 0, 1, 0);
        flag = 1;
        if (!clicked) {
            clicked = YES;
        }
    } else {
        layer1.transform = CATransform3DTranslate(layer0.transform, -subView_w/3, 0, -100);
        layer1.transform = CATransform3DRotate(layer1.transform, M_PI_4, 0, 1, 0);
        layer2.transform = CATransform3DTranslate(layer0.transform, 0, 0, 100);
        layer3.transform = CATransform3DTranslate(layer0.transform, subView_w/3, 0, -100);
        layer3.transform = CATransform3DRotate(layer3.transform, -M_PI_4, 0, 1, 0);
        layer3.contents = (__bridge id _Nullable)([UIImage imageNamed:imgs[img+2]].CGImage);
        flag = 2;
        if (!clicked) {
            clicked = YES;
        }
    }
    img++;
}

- (void)zoomIn {
    if (clicked) {
        zoom = 300;
    } else {
        zoom = 100;
    }
    switch (flag) {
        case 1:
            layer1.transform = CATransform3DTranslate(layer0.transform, 0, 0, zoom);
            break;
        case 2:
            layer2.transform = CATransform3DTranslate(layer0.transform, 0, 0, zoom);
            break;
        case 3:
            layer3.transform = CATransform3DTranslate(layer0.transform, 0, 0, zoom);
            break;
        default:
            break;
    }
    clicked = !clicked;
}

@end
