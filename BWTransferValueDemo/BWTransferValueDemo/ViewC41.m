//
//  ViewC4.m
//  BWTransferValueDemo
//
//  Created by 李勃文 on 2017/12/22.
//  Copyright © 2017年 mortal. All rights reserved.
//

#import "ViewC41.h"

#import "ViewC42.h"

@interface ViewC41 ()

@end

@implementation ViewC41

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"下一级" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor orangeColor];
    btn.frame = CGRectMake(30, 100, 200, 40);
    [self.view addSubview:btn];
}

- (void)btnClick {
    
    ViewC42 *VC42 = [[ViewC42 alloc] init];
    [self.navigationController pushViewController:VC42 animated:YES];
}

@end
