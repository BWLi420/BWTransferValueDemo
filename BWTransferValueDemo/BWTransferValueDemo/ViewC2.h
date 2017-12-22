//
//  ViewC2.h
//  BWTransferValueDemo
//
//  Created by 李勃文 on 2017/12/22.
//  Copyright © 2017年 mortal. All rights reserved.
//

#import <UIKit/UIKit.h>

// 1.
@protocol ViewC2Delegate <NSObject>

- (void)changeMainVCBackgroundColor:(UIColor *)color;
@end


@interface ViewC2 : UIViewController

// 2.
@property (nonatomic, weak) id<ViewC2Delegate> delegate;
@end
