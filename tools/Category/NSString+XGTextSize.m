//
//  NSString+XGTextSize.m
//  farmlink
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "NSString+XGTextSize.h"
#import <CommonCrypto/CommonDigest.h>

#define EmojiCodeToSymbol(c) ((((0x808080F0 | (c & 0x3F000) >> 4) | (c & 0xFC0) << 10) | (c & 0x1C0000) << 18) | (c & 0x3F) << 24)

@implementation NSString (XGTextSize)

/** 计算文本内容的尺寸，包括文本所占的宽和高 */
- (CGSize)textSizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize
{
    // 根据文本内容的字体和宽高的属性计算，文本内容所占用的控件区域的大小
    NSDictionary *attrs = @{
                            NSFontAttributeName:font,
                            };
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  attributes:attrs context:nil].size;
}

+ (CGSize)textSizeWithText:(NSString *)text andFont:(UIFont *)font andMaxSize:(CGSize)maxSize
{
    return [text textSizeWithFont:font andMaxSize:maxSize];
}

/** 计算文件或文件夹的大小 */
- (long long)fileSzie
{
    // 1.创建文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // 2.判断filePath是否为文件夹
    BOOL isDirectory = NO;
    if ([mgr fileExistsAtPath:self isDirectory:&isDirectory]) {
        // 文件夹
        
        // 2.1获取目录下的所有文件夹名称
        NSArray *subpaths = [mgr contentsOfDirectoryAtPath:self error:nil];
        
        // 2.2遍历所有文件夹，累加大小
        long long totalSize = 0.0;
        for (NSString *subpath in subpaths) {
            
            NSString *fullPath = [self stringByAppendingPathComponent:subpath];
            totalSize += [[mgr attributesOfItemAtPath:fullPath error:nil][NSFileSize] longLongValue];
        }
        return totalSize;
    } else {
        // 文件
        
        return [[mgr attributesOfItemAtPath:self error:nil][NSFileSize] longLongValue];
    }
}

+ (NSString *)emojiWithIntCode:(int)intCode {
    int symbol = EmojiCodeToSymbol(intCode);
    NSString *string = [[NSString alloc] initWithBytes:&symbol length:sizeof(symbol) encoding:NSUTF8StringEncoding];
    if (string == nil) { // 新版Emoji
        string = [NSString stringWithFormat:@"%C", (unichar)intCode];
    }
    return string;
}

- (NSString *)emoji
{
    return [NSString emojiWithStringCode:self];
}

+ (NSString *)emojiWithStringCode:(NSString *)stringCode
{
    char *charCode = (char *)stringCode.UTF8String;
    int intCode = (int)strtol(charCode, NULL, 16);
    return [self emojiWithIntCode:intCode];
}

// 判断是否是 emoji表情
- (BOOL)isEmoji
{
    BOOL returnValue = NO;
    
    const unichar hs = [self characterAtIndex:0];
    // surrogate pair
    if (0xd800 <= hs && hs <= 0xdbff) {
        if (self.length > 1) {
            const unichar ls = [self characterAtIndex:1];
            const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
            if (0x1d000 <= uc && uc <= 0x1f77f) {
                returnValue = YES;
            }
        }
    } else if (self.length > 1) {
        const unichar ls = [self characterAtIndex:1];
        if (ls == 0x20e3) {
            returnValue = YES;
        }
    } else {
        // non surrogate
        if (0x2100 <= hs && hs <= 0x27ff) {
            returnValue = YES;
        } else if (0x2B05 <= hs && hs <= 0x2b07) {
            returnValue = YES;
        } else if (0x2934 <= hs && hs <= 0x2935) {
            returnValue = YES;
        } else if (0x3297 <= hs && hs <= 0x3299) {
            returnValue = YES;
        } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
            returnValue = YES;
        }
    }
    
    return returnValue;
}

//md5 加密
- (NSString *)md5
{
    NSString *Ciphertext = @"629c03c461ae806df4fef9a557bf8816";
    NSString *pass_word = [Ciphertext stringByAppendingString:self];
    const char *cStr = [pass_word UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (unsigned int)strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (BOOL)isValidateUrl
{
    NSString *regular = @"http+:[^\\s]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regular];
    
    return [predicate evaluateWithObject:self];
}

- (NSString *)stringByTrimmingLeftCharactersInSet:(NSCharacterSet *)characterSet {
    NSUInteger location = 0;
    NSUInteger length = [self length];
    unichar charBuffer[length];
    [self getCharacters:charBuffer];
    
    for (int i=0; i < length; i++) {
        if (![characterSet characterIsMember:charBuffer[i]]) {
            location=i;
            break;
        }
    }
    
    return [self substringWithRange:NSMakeRange(location, length - location)];
}

- (NSString *)stringByTrimmingRightCharactersInSet:(NSCharacterSet *)characterSet {
    NSUInteger location = 0;
    NSUInteger length = [self length];
    unichar charBuffer[length];
    [self getCharacters:charBuffer];
    
    for (NSUInteger i=length; i > 0; i--) {
        if (![characterSet characterIsMember:charBuffer[i - 1]]) {
            length=i;
            break;
        }
    }
    
    return [self substringWithRange:NSMakeRange(location, length - location)];
}

+ (NSURL *)smartURLForString:(NSString *)str
{
    NSURL *     result;
    NSString *  trimmedStr;
    NSRange     schemeMarkerRange;
    NSString *  scheme;
    
    assert(str != nil);
    
    result = nil;
    
    trimmedStr = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ( (trimmedStr != nil) && (trimmedStr.length != 0) ) {
        schemeMarkerRange = [trimmedStr rangeOfString:@"://"];
        
        if (schemeMarkerRange.location == NSNotFound) {
            result = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", trimmedStr]];
        } else {
            scheme = [trimmedStr substringWithRange:NSMakeRange(0, schemeMarkerRange.location)];
            assert(scheme != nil);
            
            if ( ([scheme compare:@"http"  options:NSCaseInsensitiveSearch] == NSOrderedSame)
                || ([scheme compare:@"https" options:NSCaseInsensitiveSearch] == NSOrderedSame) ) {
                result = [NSURL URLWithString:trimmedStr];
            } else {
                // It looks like this is some unsupported URL scheme.
            }
        }
    }
    
    return result;
}

@end
