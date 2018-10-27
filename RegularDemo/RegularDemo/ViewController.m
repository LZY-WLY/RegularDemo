//
//  ViewController.m
//  RegularDemo
//
//  Created by yfmac001 on 2018/8/24.
//  Copyright © 2018年 yfmac001. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Regular.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSString *str = @"正则表达式测试";
//    [str regularChinese] ? NSLog(@"只包含汉字正确") : NSLog(@"只包含汉字错误");
    
//    NSString *str = @"1233";
//    [str regularNumber] ? NSLog(@"只包含数字正确") : NSLog(@"只包含数字错误");
    
//    NSString *str = @"asdAAAA";
//    [str regularLetter] ? NSLog(@"只包含字母正确") : NSLog(@"只包含字母错误");
    
//    NSString *str = @"asdAAAA123";
//    [str regularLM] ? NSLog(@"只包含字母或数字正确") : NSLog(@"只包含字母或数字错误");
    
//    NSString *str = @"41022519931021595X";
//    [str regularIDCard] ? NSLog(@"验证身份证号码正确") : NSLog(@"验证身份证号码错误");
    
//    NSString *str = @"12378945678";
//    [str regularPhoneNum] ? NSLog(@"验证手机号码正确") : NSLog(@"验证手机号码错误");
    
//    NSString *str = @"12378945678";
//    [str regularMovePhoneNum] ? NSLog(@"验证移动手机号码正确") : NSLog(@"验证移动手机号码错误");
    
//    NSString *str = @"12378945678";
//    [str regularLinkPhoneNum] ? NSLog(@"验证联通手机号码正确") : NSLog(@"验证联通手机号码错误");
    
//    NSString *str = @"12378945678";
//    [str regularTelecomPhoneNum] ? NSLog(@"验证电信手机号码正确") : NSLog(@"验证电信手机号码错误");
    
//    NSString *str = @"12378945678@qq.com";
//    [str regularEmail] ? NSLog(@"验证邮箱格式正确") : NSLog(@"验证邮箱格式错误");
    
    NSString *str = @"字.1";
    [str regularWithdrawModey] ? NSLog(@"提现金额格式正确") : NSLog(@"提现金额格式错误");
    
    NSLog(@"ceshi  %f", 4. * 100);
    
}


@end
