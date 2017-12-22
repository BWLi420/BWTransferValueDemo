//
//  ViewC42.m
//  BWTransferValueDemo
//
//  Created by 李勃文 on 2017/12/22.
//  Copyright © 2017年 mortal. All rights reserved.
//

#import "ViewC42.h"

@interface ViewC42 ()

@end

@implementation ViewC42

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"回到首页改变颜色" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor orangeColor];
    btn.frame = CGRectMake(30, 100, 200, 40);
    [self.view addSubview:btn];
}

- (void)btnClick {
    
    //1.发布通知
    NSDictionary *dict = @{@"color":[UIColor grayColor]};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangeMainBgColor" object:@"VC42" userInfo:dict];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
