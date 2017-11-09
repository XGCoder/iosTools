//
//  PublicMethodHeader.h
//  FarmlinkApp
//
//  Created by apple on 16/6/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PublicMethodHeader : NSObject
extern NSString *const FL_KEY_NetworkStatus;

// 判断系统
#define iOS7 ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending)
#define iOS8 ([[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending)
#define iOS9 ([[[UIDevice currentDevice] systemVersion] compare:@"9.0"] != NSOrderedAscending)
#define iOS10 ([[[UIDevice currentDevice] systemVersion] compare:@"10.0"] != NSOrderedAscending)
#define iOS11 ([[[UIDevice currentDevice] systemVersion] compare:@"11.0"] != NSOrderedAscending)

/**------------------------系统方法------------------------*/

/**
 *  判断当前网络状态是否可用
 */
BOOL networkIsReachable(void);

/**
 *  强提示
 */
void XGAlert(NSString *title ,NSString *message);

/**
 *  保存用户偏好设置
 */
void XGUserDefaults(id object, NSString *key);

/**
 *  获取用户偏好设置
 */
id XGUserDefaultsValue(NSString *key);

/**-----------------------判断设备名称------------------------*/
BOOL IS_iphoneX(void);



/**-----------屏幕顶部状态栏高度 和 底下tabbar高度---------------*/
/** 默认 顶部状态栏+导航栏 使用的方法 */
CGFloat common_TopStatus_NavBar(void);
/** iphoneX 顶部状态栏+导航栏 高度 */
CGFloat iphoneX_TopStatus_NavBar(void);
/** 默认 顶部状态栏 使用的方法 */
CGFloat common_TopStatusbar(void);
/** iphoneX 顶部状态栏 高度 */
CGFloat iphoneX_TopStatusbar(void);
/** 默认 底部 tabbar 使用的方法 */
CGFloat common_BottomTabbar(void);
/** 默认 iPhone X 底部 tabbar (适用于调节二级页面tabbar) */
CGFloat common_iphoneX_BottomTabbar(void);
/** iphoneX_tabbar 底部添加了tabbar的高度 */
CGFloat iphoneX_BottomTabbar(void);


/** 获取设备类型 */
NSString * deviceModelName(void);
@end
