//
//  NSDate+Extension.m
//  FarmlinkApp
//
//  Created by apple on 2017/9/21.
//  Copyright © 2017年 apple. All rights reserved.
//


#import "NSDate+Extension.h"

@implementation FLDateItem
- (NSString *)description
{
    return [NSString stringWithFormat:@"%zd天%zd小时%zd分%zd秒", self.day, self.hour, self.minute, self.second];
}
@end


@implementation NSDate (Extension)
+ (FLDateItem *)date_timeIntervalSinceDate:(NSDate *)anotherDate;
{
    // createdAtDate和nowDate之间的时间间隔
    NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:anotherDate];
    
    FLDateItem *item = [[FLDateItem alloc] init];
    
    // 相差多少天
    int intInterval = (int)interval;
    int secondsPerDay = 24 * 3600;
    item.day = intInterval / secondsPerDay;
    
    // 相差多少小时
    int secondsPerHour = 3600;
    item.hour = (intInterval % secondsPerDay) / secondsPerHour;
    
    // 相差多少分钟
    int secondsPerMinute = 60;
    item.minute = ((intInterval % secondsPerDay) % secondsPerHour) / secondsPerMinute;
    
    // 相差多少秒
    item.second = ((intInterval % secondsPerDay) % secondsPerHour) % secondsPerMinute;
    
    return item;
}

+ (BOOL)dateSinceOldDate:(NSDate *)oldDte HourTime:(NSInteger)hour
{
    FLDateItem * dateItem = [self date_timeIntervalSinceDate:oldDte];
    return dateItem.hour >= hour;
}

+ (BOOL)dateSinceOldDate:(NSDate *)oldDte secondTime:(NSInteger)second
{
    NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:oldDte];
    int intInterval = (int)interval;
    return intInterval > second;
}

@end
