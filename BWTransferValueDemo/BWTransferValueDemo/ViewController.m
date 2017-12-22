//
//  ViewController.m
//  BWTransferValueDemo
//
//  Created by 李勃文 on 2017/12/22.
//  Copyright © 2017年 mortal. All rights reserved.
//

#import "ViewController.h"

#import "ViewC1.h"
#import "ViewC2.h"
#import "ViewC3.h"

@interface ViewController ()<ViewC2Delegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - 正向传值
- (IBAction)forwardBtnClick:(UIButton *)sender {
    
    ViewC1 *VC1 = [[ViewC1 alloc] init];
    VC1.value_1 = @"我是正向传值";
    [self.navigationController pushViewController:VC1 animated:YES];
}

#pragma mark - 代理
- (IBAction)delegateBtnClick:(UIButton *)sender {
    
    ViewC2 *VC2 = [[ViewC2 alloc] init];
    VC2.delegate = self;
    [self.navigationController pushViewController:VC2 animated:YES];
}

- (void)changeMainVCBackgroundColor:(UIColor *)color {
    
    self.view.backgroundColor = color;
}

#pragma mark - block
- (IBAction)blockBtnClick:(UIButton *)sender {
    
    ViewC3 *VC3 = [[ViewC3 alloc] init];
    VC3.changeMainVCBgColor = ^(UIColor *color) {
        self.view.backgroundColor = color;
    };
    [self.navigationController pushViewController:VC3 animated:YES];
}

#pragma mark - 通知
- (IBAction)notiBtnClick:(UIButton *)sender {
}

#pragma mark - 单例
- (IBAction)singleBtnClick:(UIButton *)sender {
}



@end
