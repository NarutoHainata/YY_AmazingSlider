//
//  SliderView.m
//  YY_AmazingSlider
//
//  Created by yang on 2016/11/16.
//  Copyright © 2016年 poplary. All rights reserved.
//



#import "SliderView.h"

@implementation SliderView

+ (UIScrollView *)sliderAmazingView:(CGRect)frame parentView:(id)parentView dataArr:(NSMutableArray *)dataArr{

    return [[self alloc]initWithFrame:frame withParentView:parentView withDataArr:dataArr];
}
- (instancetype)initWithFrame:(CGRect)frame withParentView:(id)parentView withDataArr:(NSMutableArray *)dataArr{
    
    dataArrCount = dataArr.count;
    
    if (self = [super initWithFrame:frame]) {
        
        self.delegate = self;
        self.backgroundColor = [UIColor greenColor];
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.contentSize = CGSizeMake(self.frame.size.width * dataArr.count, self.frame.size.height);
        self.showsHorizontalScrollIndicator = NO;
        [self setContentOffset:CGPointMake(self.frame.size.width, 0) animated:NO];

        for (int i = 0; i<dataArr.count; i++) {
            
            UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width * i, 0, self.frame.size.width, self.frame.size.height)];
            iv.image = [UIImage imageNamed:dataArr[i]];
            [self addSubview:iv];
            
        }
        
        [parentView addSubview:self];
        [parentView addSubview:self.pageC];
        [self circulationScorll];
    }
    return self;
}

- (UIPageControl *)pageC{
    
    if (!_pageC) {
        _pageC = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 60, 100, 30)];
        _pageC.backgroundColor = [UIColor clearColor];
        [_pageC addTarget:self action:@selector(pageCClick:) forControlEvents:UIControlEventValueChanged];
        _pageC.numberOfPages = dataArrCount-2;
        _pageC.currentPage = 0;
        _pageC.pageIndicatorTintColor = [UIColor whiteColor];
        _pageC.currentPageIndicatorTintColor = [UIColor redColor];

        _pageC.center = CGPointMake(self.center.x, self.center.y + 0.5 * self.frame.size.height - 15);
        
    }
    return _pageC;
}

- (void)pageCClick:(UIPageControl *)sender{
    
//    CGRect rect = CGRectMake(sender.currentPage * SCREEN_WIDTH, 0, self.showScroll.yy_width, self.showScroll.yy_height);
//    [self.showScroll scrollRectToVisible:rect animated:YES];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat currentContenOffsetX = self.contentOffset.x;
    
    if (currentContenOffsetX == self.frame.size.width * (dataArrCount-1)) {
        
        [self setContentOffset:CGPointMake(self.frame.size.width, 0) animated:NO];
        
    }
    else if (currentContenOffsetX == 0.00){
        
        
        [self setContentOffset:CGPointMake(self.frame.size.width * (dataArrCount-2), 0) animated:NO];
        
    }
    
    if (currentContenOffsetX < self.frame.size.width * 0.5) {
        
        [self.pageC setCurrentPage:dataArrCount-3];
    }
    else if (currentContenOffsetX > self.frame.size.width * (dataArrCount - 1.5)){
        [self.pageC setCurrentPage:0];
    }
    else{
        
        [self.pageC setCurrentPage:(int)(currentContenOffsetX+self.frame.size.width * 0.5)/self.frame.size.width - 1];
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    
}
- (void)circulationScorll{
    
    timer = [NSTimer scheduledTimerWithTimeInterval:5 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        CGFloat currentContenOffsetX = self.contentOffset.x;
        
        if (currentContenOffsetX == self.frame.size.width * (dataArrCount - 1)) {
            
            [self setContentOffset:CGPointMake(self.frame.size.width, 0) animated:NO];
            
        }
        else if (currentContenOffsetX == 0.00){
            
            
            [self setContentOffset:CGPointMake(self.frame.size.width * (dataArrCount - 2), 0) animated:NO];
            
        }
        else{
            
            [self setContentOffset:CGPointMake(currentContenOffsetX+self.frame.size.width, 0) animated:YES];
            
        }
        
        if (currentContenOffsetX < self.frame.size.width * 0.5) {
            
            [self.pageC setCurrentPage:dataArrCount - 3 ];
        }
        else if (currentContenOffsetX > self.frame.size.width * (dataArrCount - 2.5)){
            [self.pageC setCurrentPage:0];
        }
        else{
            
            [self.pageC setCurrentPage:(int)(currentContenOffsetX + self.frame.size.width * 0.5)/self.frame.size.width];
        }
        
    }];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [timer invalidate];
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    [self circulationScorll];
}

@end
