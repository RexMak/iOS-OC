//
//  ThreeLayerExchangeView.h
//  ThreePictures3DScrollView
//
//  Created by Ibokan1 on 15/12/29.
//  Copyright © 2015年 rex mak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreeLayerExchangeView : UIView

- (id)initWithFrame:(CGRect)frame Images:(NSMutableArray *)images;
- (void)leftTranslate;
- (void)rightTranslate;
- (void)zoomIn;
@end
