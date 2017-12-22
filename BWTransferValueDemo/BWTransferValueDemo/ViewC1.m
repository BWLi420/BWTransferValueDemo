//
//  ViewC1.m
//  BWTransferValueDemo
//
//  Created by 李勃文 on 2017/12/22.
//  Copyright © 2017年 mortal. All rights reserved.
//

#import "ViewC1.h"

#import "Person.h"

@interface ViewC1 ()

@end

@implementation ViewC1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //由于没有使用xib，view背景色默认透明，当push过来的时候会产生一种卡顿的视觉
    //设置背景色即可解决
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //正向传值结果
    NSLog(@"正向传值结果：%@", self.value_1);
    
    Person *person = [[Person alloc] init];
    NSLog(@"取出单例赋值：%@", person.name);
}



@end
