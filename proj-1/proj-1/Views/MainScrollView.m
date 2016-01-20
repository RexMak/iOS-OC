//
//  MainScrollView.m
//  proj-1
//
//  Created by Ibokan1 on 15/12/30.
//  Copyright © 2015年 rex mak. All rights reserved.
//

#import "MainScrollView.h"

@interface MainScrollView ()
{
    UIView *view;
}
@end

@implementation MainScrollView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width-10, frame.size.height * 1.5)];
        view.backgroundColor = [UIColor cyanColor];
        [self addSubview:view];
        self.alwaysBounceVertical = YES;
        self.alwaysBounceHorizontal = YES;
        self.indicatorStyle = UIScrollViewIndicatorStyleBlack;
        
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer)];
        [self addGestureRecognizer:panGesture];
    }
    
    return self;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"scroll");
    [self flashScrollIndicators];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
