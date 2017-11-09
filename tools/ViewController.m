//
//  ViewController.m
//  tools
//
//  Created by apple on 2017/11/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "PublicMethodHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    XGUserDefaults(@"存储的数据", @"key");
    NSString * str = XGUserDefaultsValue(@"key");
    NSLog(@"str : %@",str);
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
