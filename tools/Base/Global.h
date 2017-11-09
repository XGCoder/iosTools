//
//  Global.h
//  FarmlinkApp
//
//  Created by David on 15/11/18.
//  Copyright © 2015年 David. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Global : NSObject

+ (Global*)sharedGlobal;

- (void)globalInit;

@end
