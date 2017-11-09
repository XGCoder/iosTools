//
//  UIColor+string.h
//  farmlink
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (string)
//字符串转颜色
+(UIColor *)colorWithHexString: (NSString *) stringToConvert;
@end
