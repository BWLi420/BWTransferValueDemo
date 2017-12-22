# BWTransferValueDemo
传值的常用方式

> 总结 iOS 日常开发中的几种常用传值方式：
> 1. 正向传值
> 2. 代理传值
> 3. block传值
> 4. 通知传值
> 5. 单例

### 1. 正向传值
- 使用场景：界面 A 跳转界面 B 的同时，向界面 B 传递值，即上级向下级传递
- 步骤：
    1. 在界面 B 的 .h 文件中公开声明一个属性

        ```
        @interface ViewC1 : UIViewController
    
        //正向传值 1
        @property (nonatomic, copy) NSString *value_1;
    
        @end
        ```
    2. 导入界面 B 的头文件，并使用 B 创建出一个对象，对属性进行赋值

        ```
        ViewC1 *VC1 = [[ViewC1 alloc] init];
        VC1.value_1 = @"我是正向传值";
        [self.navigationController pushViewController:VC1 animated:YES];
        ```

### 2. 代理传值
- 使用场景：界面 A 跳转界面 B ，界面 B 返回界面 A 时传结果给 A，即下级向上级传递
- 步骤：
    1. 在界面 B 头文件中定义协议
    
        ```
        @protocol ViewC2Delegate <NSObject>
    
        - (void)changeMainVCBackgroundColor:(UIColor *)color;
        @end
        ```
    2. 在界面 B 头文件中定义代理属性
        
        ```
        @interface ViewC2 : UIViewController

        @property (nonatomic, weak) id<ViewC2Delegate> delegate;
        @end
        ```
    3. 在界面 B 的 .m 中合适位置调用代理方法
        
        ```
        // 3.调用代理方法 <需先进行检测>
        if ([self.delegate respondsToSelector:@selector(changeMainVCBackgroundColor:)]) {
            [self.delegate changeMainVCBackgroundColor:[UIColor greenColor]];
        }
        ```
    4. 在界面 A 中设置代理
    5. 在界面 A 中遵守协议
    
        ```
        @interface ViewController ()<ViewC2Delegate>
        @end
        
        ViewC2 *VC2 = [[ViewC2 alloc] init];
        VC2.delegate = self;
        [self.navigationController pushViewController:VC2 animated:YES];
        ```
    6. 实现代理协议中的方法

        ```
        - (void)changeMainVCBackgroundColor:(UIColor *)color {
            
            self.view.backgroundColor = color;
        }
        ```
        
### 3. block传值
- 使用场景：类似代理，当协议中的方法只有一个，可以使用 block，此时可以不用写协议，相当于简化的代理
- 步骤：
    1. 在发送者头文件中定义 block 属性

        ```
        @interface ViewC3 : UIViewController
        
        @property (nonatomic, copy) void (^changeMainVCBgColor)(UIColor *color);
        
        @end
        ```
    2. 在发送者 .m 文件合适位置调用 block

        ```
        //调用block
        if (self.changeMainVCBgColor) {
            self.changeMainVCBgColor([UIColor redColor]);
        }
        ```
    3. 在接收者中实现具体操作

        ```
        ViewC3 *VC3 = [[ViewC3 alloc] init];
        VC3.changeMainVCBgColor = ^(UIColor *color) {
            self.view.backgroundColor = color;
        };
        [self.navigationController pushViewController:VC3 animated:YES];
        ```
        
### 4. 通知传值
- 使用场景：代理一般适用于上下级之间，若是多级结构时会相当麻烦，使用通知没有级别结构限制
- 步骤：
    1. 在发送者中发布通知

        ```
        //1.发布通知
        NSDictionary *dict = @{@"color":[UIColor grayColor]};
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangeMainBgColor" object:@"VC42" userInfo:dict];
        ```
    2. 在接收者中注册通知

        ```
        //2.一般在 viewDidLoad 中注册通知
        //通知名称需一致
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeColor:) name:@"viewDidLoad" object:@"VC42"];
        ```
    3. 在接收者中实现通知具体操作

        ```
        - (void)changeColor:(NSNotification *)noti {
            
            NSDictionary *dict = noti.userInfo;
            self.view.backgroundColor = [dict valueForKeyPath:@"color"];
        }
        ```
    4. 在接收者中注销通知

        ```
        - (void)dealloc {
            
            [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ChangeMainBgColor" object:@"VC42"];
        }
        ```

### 5. 单例传值
- 使用场景：多次创建仅有唯一一个，随用随取
- 步骤：
    1. 创建单例类，声明需要传递的属性

        ```
        @interface Person : NSObject
        
        interfaceSingleton(PersonName);
        
        @property (nonatomic, copy) NSString *name;
        
        @end
        ```
    2. 实例化一个对象，对对象的属性进行赋值

        ```
        Person *person = [[Person alloc] init];
        person.name = @"单例赋值的名字";
        ```
    3. 在需要用到的地方实例化一个对象，取出属性值

        ```
        Person *person = [[Person alloc] init];
        NSLog(@"取出单例赋值：%@", person.name);
        ```
        PS: 创建单例类请查看我之前的文章[《iOS 单例模式简析》](https://www.jianshu.com/p/7b7556d7a010)

---
个人博客：[https://mortal-master.github.io](https://mortal-master.github.io)
