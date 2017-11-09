//
//  NSDate+Extension.h
//  FarmlinkApp
//
//  Created by apple on 2017/9/21.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface FLDateItem : NSObject
@property (nonatomic, assign) NSInteger day;
@property (nonatomic, assign) NSInteger hour;
@property (nonatomic, assign) NSInteger minute;
@property (nonatomic, assign) NSInteger second;
@end

@interface NSDate (Extension)
+ (FLDateItem *)date_timeIntervalSinceDate:(NSDate *)anotherDate;

/** 给定一个时间 查看是否相差多少小时 */
+ (BOOL)dateSinceOldDate:(NSDate *)oldDte HourTime:(NSInteger)hour;
+ (BOOL)dateSinceOldDate:(NSDate *)oldDte secondTime:(NSInteger)second;

@end
