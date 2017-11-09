//
//  Global.m
//  FarmlinkApp
//
//  Created by David on 15/11/18.
//  Copyright © 2015年 David. All rights reserved.
//

#import "Global.h"
#import "PublicMethodHeader.h"
#import "Reachability.h"

@interface Global()

@property(nonatomic,strong)Reachability * reach;


@end

@implementation Global

+ (Global*)sharedGlobal
{
    static Global *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


- (void)globalInit
{
    [self reachabilityNetWorkStatus:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(myReachabilityChanged:) name:FL_kReachabilityChangedNotification object:nil];
    
}


#pragma mark - 检测网络
- (void)reachabilityNetWorkStatus:(void (^)(NSString *networkStatus))success;
{
    NSString * tips = @"";
    switch (self.reach.currentReachabilityStatus)
    {
        case NotReachable:
            tips = @"无网络连接";
            break;
            
        case ReachableViaWiFi:
            tips = @"Wifi";
            break;
            
        case ReachableViaWWAN:
            NSLog(@"移动流量");
        case kReachableVia2G:
            tips = @"2G";
            break;
            
        case kReachableVia3G:
            tips = @"3G";
            break;
            
        case kReachableVia4G:
            tips = @"4G";
            break;
    }
    XGUserDefaults(@(self.reach.currentReachabilityStatus),FL_KEY_NetworkStatus);
    if (success) {
        success(tips);
    }
    NSLog(@"tips = %@",tips);
}

- (void)myReachabilityChanged:(NSNotification *)note
{
    Reachability * newReash = [note object];
    XGUserDefaults(@(newReash.currentReachabilityStatus),FL_KEY_NetworkStatus);
    if (![XGUserDefaultsValue(FL_KEY_NetworkStatus) integerValue]){
        /// 网络有变化时 这里是在弱弹框提示 网络情况
//        [MBProgressHUD showError:@"网络连接失败,请检查网络!" toView:nil];
    }
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
