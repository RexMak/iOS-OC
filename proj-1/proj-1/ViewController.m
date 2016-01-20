//
//  ViewController.m
//  proj-1
//
//  Created by Ibokan1 on 15/12/30.
//  Copyright © 2015年 rex mak. All rights reserved.
//

#import "ViewController.h"
#import "Views/MainScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    MainScrollView *mainSV = [[MainScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 80, self.view.frame.size.height - 80)];
    mainSV.center = self.view.center;
    
    [self.view addSubview:mainSV];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
