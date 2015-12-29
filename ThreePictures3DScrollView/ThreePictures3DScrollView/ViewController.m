//
//  ViewController.m
//  ThreePictures3DScrollView
//
//  Created by Ibokan1 on 15/12/29.
//  Copyright © 2015年 rex mak. All rights reserved.
//

#import "ViewController.h"
#import "ThreeLayerExchangeView.h"

@interface ViewController ()
{
    NSMutableArray *imgs;
    ThreeLayerExchangeView *threeView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    imgs = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7", nil];
    
    threeView = [[ThreeLayerExchangeView alloc] initWithFrame:CGRectMake(30, 300, 200, 160) Images:imgs];
    threeView.center = self.view.center;
    
    [self.view addSubview:threeView];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    leftButton.frame = CGRectMake(60, self.view.frame.size.height - 70, 60, 30);
    leftButton.backgroundColor = [UIColor lightGrayColor];
    [leftButton setTitle:@"left" forState:0];
    [self.view addSubview:leftButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    rightButton.frame = CGRectMake(self.view.frame.size.width - 120, self.view.frame.size.height - 70, 60, 30);
    rightButton.backgroundColor = [UIColor lightGrayColor];
    [rightButton setTitle:@"right" forState:0];
    [self.view addSubview:rightButton];
    
    UIButton *zoomButton = [UIButton buttonWithType:UIButtonTypeSystem];
    zoomButton.frame = CGRectMake(self.view.frame.size.width/2 - 30, self.view.frame.size.height - 70, 60, 30);
    zoomButton.backgroundColor = [UIColor lightGrayColor];
    [zoomButton setTitle:@"zoom" forState:0];
    [self.view addSubview:zoomButton];
    
    [leftButton addTarget:self action:@selector(leftPic:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton addTarget:self action:@selector(rightPic:) forControlEvents:UIControlEventTouchUpInside];
    [zoomButton addTarget:self action:@selector(zoomIn:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)leftPic:(UIButton *)sender {
    [threeView leftTranslate];
}

- (void)rightPic:(UIButton *)sender {
    [threeView rightTranslate];
}

- (void)zoomIn:(UIButton *)sender {
    [threeView zoomIn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
