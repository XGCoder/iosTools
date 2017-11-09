//
//  UITextField+LimitStringType.h
//  FarmlinkApp
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (LimitStringType)
//限制字符串必须是数字类型
+ (BOOL)validateNumber:(NSString*)number;
@end
