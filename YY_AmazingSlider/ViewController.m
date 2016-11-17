//
//  ViewController.m
//  YY_AmazingSlider
//
//  Created by yang on 2016/11/16.
//  Copyright © 2016年 poplary. All rights reserved.
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define Height 200
#import "ViewController.h"
#import "SliderView.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //设置数据
    NSMutableArray *arrData = [NSMutableArray arrayWithObjects:@"img03",@"img01",@"img02",@"img03",@"img01", nil];
    
    [SliderView sliderAmazingView:CGRectMake(0, 100, SCREEN_WIDTH, 200) parentView:self.view dataArr:arrData];
    
    
}

@end
