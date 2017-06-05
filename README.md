# MPUserDefaults

A way to easily access NSUserDefaults

# 使用方式
	创建自定义类，继承自 MPUserDefaults ，通过 set和get方法去设置和获取值就OK了


```objc
#import "MPUserDefaults.h"

@interface TestDemo : MPUserDefaults

@property (copy, nonatomic)NSString *userName;

@property (copy, nonatomic)NSString *userID;

@property (copy, nonatomic)NSString *version;

@property (assign, nonatomic)BOOL firstTimeLogin;

@end

```
具体使用代码：

```objc
    TestDemo *t = [TestDemo standardUserDefaults];
    if (!t.firstTimeLogin) {
        t.firstTimeLogin = YES;
        NSLog(@"first launch ...");
    }else {
        NSLog(@"aha ...");
    }
    

```

#  

