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
#import "ViewC41.h"
#import "Person.h"

@interface ViewController ()<ViewC2Delegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //一般在 viewDidLoad 中注册通知
    //通知名称需一致
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeColor:) name:@"ChangeMainBgColor" object:@"VC42"];
}

- (void)changeColor:(NSNotification *)noti {
    
    NSDictionary *dict = noti.userInfo;
    self.view.backgroundColor = [dict valueForKeyPath:@"color"];
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
    
    ViewC41 *VC41 = [[ViewC41 alloc] init];
    [self.navigationController pushViewController:VC41 animated:YES];
}

#pragma mark - 单例
- (IBAction)singleBtnClick:(UIButton *)sender {
    
    Person *person = [[Person alloc] init];
    person.name = @"单例赋值的名字";
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ChangeMainBgColor" object:@"VC42"];
}

@end
