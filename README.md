# iosTools
自己简单归类的工具类

PublicMethodHeader类:

当判断当前网络时,一般是需要在当前类导入头文件,实例对象需要经过实例后方法才能使用,分类需要类名调用才能使用,但是现在你只需要在这里这样输入:

`networkIsReachable()`

这样就可以读取出所存储的网络状态,返回值是`BOOL`值,这样就能在请求数据之前直接判断当前是否有网,而对其进行相应的处理.

用户偏好设置:

一般情况下在项目中使用时是这样的:

``` NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  [userDefaults setObject:object forKey:key];
```

现在你只需要这样操作:

```
XGUserDefaults(@"存储的数据", @"key");

```


读取操作可以这样:


```
NSString * str = XGUserDefaultsValue(@"key");

```

key 值 可以定义成一个宏, 在项目中可以集中定义

适配 ```iPhone X```?

在这里只需要一个 ```IS_iphoneX()```  即可

这些只是一些简便的使用工具,后期会不断更新...
