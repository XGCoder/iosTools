//
//  PublicMethodHeader.m
//  FarmlinkApp
//
//  Created by apple on 16/6/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PublicMethodHeader.h"
#import <sys/utsname.h>

@implementation PublicMethodHeader
NSString *const FL_KEY_NetworkStatus = @"key_networkStatus";


BOOL networkIsReachable()
{
    if ([XGUserDefaultsValue(FL_KEY_NetworkStatus) integerValue])
    {
        return YES;
    } else
    {
        return NO;
    }
}

void XGAlert(NSString *title ,NSString *message)
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"好的"
                                          otherButtonTitles:nil, nil];
    [alert show];
}


void XGUserDefaults(id object, NSString *key)
{
    @try {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:object forKey:key];
        [userDefaults synchronize];
    } @catch (NSException *exception) {
        
        
    } @finally {
        
    }
}


id XGUserDefaultsValue(NSString *key)
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    id  object = [userDefaults objectForKey:key];
    return object;
}

/** 判断是否 iphone X */
BOOL IS_iphoneX()
{
    if ([deviceModelName() isEqualToString:@"iPhone X"]) {
        return YES;
    }
    if ([deviceModelName() isEqualToString:@"Simulator"] && iOS11) {
        return YES;
    }else{
        return NO;
    }
}

/** 默认 顶部状态栏+导航栏 使用的方法 */
CGFloat common_TopStatus_NavBar()
{
    return 64.0;
}

/** iphoneX 顶部状态栏+导航栏 高度 */
CGFloat iphoneX_TopStatus_NavBar()
{
    return iphoneX_TopStatusbar() + 44.0;;
}


/** 默认 顶部状态栏 使用的方法 */
CGFloat common_TopStatusbar()
{
    return 20.0;
}

/** iphoneX 顶部状态栏 高度 */
CGFloat iphoneX_TopStatusbar()
{
    return 39.0;
}


/** 默认 底部 tabbar 使用的方法 */
CGFloat common_BottomTabbar()
{
    return 49.0;
}

/** 默认 iPhone X 底部 tabbar (适用于调节二级页面tabbar) */
CGFloat common_iphoneX_BottomTabbar()
{
    return 30.0;
}


/** iphoneX_tabbar 高度 */
CGFloat iphoneX_BottomTabbar()
{
    return  30.0 + common_BottomTabbar();
}


/** 获取设备类型 */
NSString * deviceModelName()
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine
                                            encoding:NSUTF8StringEncoding];
    //simulator
    if ([platform isEqualToString:@"i386"])          return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])        return @"Simulator";
    
    //iPhone
    if ([platform isEqualToString:@"iPhone1,1"])     return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])     return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])     return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])     return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"])     return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"])     return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])     return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"])     return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"])     return @"iPhone 5C";
    if ([platform isEqualToString:@"iPhone5,4"])     return @"iPhone 5C";
    if ([platform isEqualToString:@"iPhone6,1"])     return @"iPhone 5S";
    if ([platform isEqualToString:@"iPhone6,2"])     return @"iPhone 5S";
    if ([platform isEqualToString:@"iPhone7,1"])     return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"])     return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"])     return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"])     return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"])     return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"])     return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,3"])     return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"])     return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,4"])     return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone10,1"])    return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,4"])    return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,2"])    return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,5"])    return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,3"])    return @"iPhone X";
    if ([platform isEqualToString:@"iPhone10,6"])    return @"iPhone X";
    
    return platform;
}

@end
