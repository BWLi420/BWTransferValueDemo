//
//  Person.h
//  BWTransferValueDemo
//
//  Created by 李勃文 on 2017/12/22.
//  Copyright © 2017年 mortal. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BWSingleton.h"

@interface Person : NSObject

interfaceSingleton(PersonName);

@property (nonatomic, copy) NSString *name;

@end
