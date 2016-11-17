//
//  SliderView.h
//  YY_AmazingSlider
//
//  Created by yang on 2016/11/16.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderView : UIScrollView<UIScrollViewDelegate>{

    NSTimer *timer;
    NSInteger dataArrCount;
}

/** pageControl */
@property (nonatomic, strong) UIPageControl *pageC;

+ (UIScrollView *)sliderAmazingView:(CGRect)frame parentView:(id)parentView dataArr:(NSMutableArray *)dataArr;
@end
