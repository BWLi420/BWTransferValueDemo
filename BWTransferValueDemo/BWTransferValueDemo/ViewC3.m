//
//  ViewC3.m
//  BWTransferValueDemo
//
//  Created by 李勃文 on 2017/12/22.
//  Copyright © 2017年 mortal. All rights reserved.
//

#import "ViewC3.h"

@interface ViewC3 ()

@end

@implementation ViewC3

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
    
    //调用block
    if (self.changeMainVCBgColor) {
        self.changeMainVCBgColor([UIColor redColor]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}



@end
