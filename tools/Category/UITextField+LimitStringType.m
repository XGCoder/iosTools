//
//  UITextField+LimitStringType.m
//  FarmlinkApp
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UITextField+LimitStringType.h"

@implementation UITextField (LimitStringType)
+ (BOOL)validateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

@end
