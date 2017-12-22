//
//  ViewC2.m
//  BWTransferValueDemo
//
//  Created by 李勃文 on 2017/12/22.
//  Copyright © 2017年 mortal. All rights reserved.
//

#import "ViewC2.h"

@interface ViewC2 ()

@end

@implementation ViewC2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点击改变首页颜色" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor orangeColor];
    btn.frame = CGRectMake(30, 100, 200, 40);
    [self.view addSubview:btn];
}

- (void)btnClick {
    
    // 3.调用代理方法 <需先进行检测>
    if ([self.delegate respondsToSelector:@selector(changeMainVCBackgroundColor:)]) {
        [self.delegate changeMainVCBackgroundColor:[UIColor greenColor]];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
