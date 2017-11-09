//
//  NSString+XGTextSize.h
//  farmlink
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (XGTextSize)
/**
 *  计算文本内容的尺寸，包括文本所占的宽和高
 */
- (CGSize)textSizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize;
+ (CGSize)textSizeWithText:(NSString *)text andFont:(UIFont *)font andMaxSize:(CGSize)maxSize;

/**
 *  计算文件或文件夹的大小
 *
 *  @return 文件的大小
 */
- (long long)fileSzie;


/**
 *  将十六进制的编码转为emoji字符
 */
+ (NSString *)emojiWithIntCode:(int)intCode;

/**
 *  将十六进制的编码转为emoji字符
 */
+ (NSString *)emojiWithStringCode:(NSString *)stringCode;
- (NSString *)emoji;

/**
 *  是否为emoji字符
 */
- (BOOL)isEmoji;


- (NSString *)md5;

- (BOOL)isValidateUrl;
/**
 *  去除左边空格
 */
- (NSString *)stringByTrimmingLeftCharactersInSet:(NSCharacterSet *)characterSet ;
/**
 *  去除右边空格
 */
- (NSString *)stringByTrimmingRightCharactersInSet:(NSCharacterSet *)characterSet ;

+ (NSURL *)smartURLForString:(NSString *)str;

@end
