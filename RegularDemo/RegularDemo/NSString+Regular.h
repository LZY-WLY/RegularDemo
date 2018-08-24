//
//  NSString+Regular.h
//  RegularDemo
//
//  Created by yfmac001 on 2018/8/24.
//  Copyright © 2018年 yfmac001. All rights reserved.
//   正则表达式

#import <Foundation/Foundation.h>

@interface NSString (Regular)
/**
 是否只包含中文

 @return NO: 不是   YES: 是
 */
- (BOOL)regularChinese;

/**
 是否只包含数字

 @return NO: 不是   YES: 是
 */
- (BOOL)regularNumber;

/**
 是否只包含字母
 
 @return NO: 不是   YES: 是
 */
- (BOOL)regularLetter;

/**
 是否只包含字母或数字
 
 @return NO: 不是   YES: 是
 */
- (BOOL)regularLM;

/**
 验证身份证号码是否正确
 
 @return NO: 不是   YES: 是
 */
- (BOOL)regularIDCard;

/**
 验证邮箱格式是否正确
 
 @return NO: 不是   YES: 是
 */
- (BOOL)regularEmail;

/**
 是否是手机号
 
 @return NO: 不是   YES: 是
 */
- (BOOL)regularPhoneNum;

/**
 是否是移动手机号
 
 @return NO: 不是   YES: 是
 */
- (BOOL)regularMovePhoneNum;

/**
 是否是联通手机号
 
 @return NO: 不是   YES: 是
 */
- (BOOL)regularLinkPhoneNum;

/**
 是否是电信手机号
 
 @return NO: 不是   YES: 是
 */
- (BOOL)regularTelecomPhoneNum;

/**
 是否是银行卡
 
 @return NO: 不是   YES: 是
 */
- (BOOL)regularBankCard;

@end
