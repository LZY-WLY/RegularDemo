//
//  NSString+Regular.m
//  RegularDemo
//
//  Created by yfmac001 on 2018/8/24.
//  Copyright © 2018年 yfmac001. All rights reserved.
//

#import "NSString+Regular.h"

@implementation NSString (Regular)
//是否只包含中文
- (BOOL)regularChinese {
    NSString *regexStr = @"[\u4e00-\u9fa5]+";
    NSPredicate *predStr = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regexStr];
    if (![predStr evaluateWithObject:self]) {
        return NO;
    }else {
        return YES;
    }
}

//是否只包含数字
- (BOOL)regularNumber {
    NSString *regexNumber = @"[0-9]*";
    NSPredicate *predNumber = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regexNumber];
    if (![predNumber evaluateWithObject:self]) {
        return NO;
    }else {
        return YES;
    }
}

//是否只包含字母
- (BOOL)regularLetter {
    NSString *regexLetter = @"[a-zA-Z]*";
    NSPredicate *predLetter = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regexLetter];
    if (![predLetter evaluateWithObject:self]) {
        return NO;
    }else {
        return YES;
    }
}

//是否只包含字母或数字
- (BOOL)regularLM {
    NSString *regexLM = @"[a-zA-Z0-9]*";
    NSPredicate *predLM = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regexLM];
    if (![predLM evaluateWithObject:self]) {
        return NO;
    }else {
        return YES;
    }
}

//验证身份证号码是否正确
- (BOOL)regularIDCard {
    //长度不为18的都排除掉
    if (self.length != 18) {
        return NO;
    }
    
    //校验格式
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL flag = [identityCardPredicate evaluateWithObject:self];
    
    if (!flag) {
        return flag;    //格式错误
    }else {
        //格式正确在判断是否合法
        
        //将前17位加权因子保存在数组里
        NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
        
        //这是除以11后，可能产生的11位余数、验证码，也保存成数组
        NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
        
        //用来保存前17位各自乖以加权因子后的总和
        NSInteger idCardWiSum = 0;
        for(int i = 0;i < 17;i++)
        {
            NSInteger subStrIndex = [[self substringWithRange:NSMakeRange(i, 1)] integerValue];
            NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
            
            idCardWiSum+= subStrIndex * idCardWiIndex;
            
        }
        
        //计算出校验码所在数组的位置
        NSInteger idCardMod=idCardWiSum%11;
        
        //得到最后一位身份证号码
        NSString * idCardLast= [self substringWithRange:NSMakeRange(17, 1)];
        
        //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
        if(idCardMod==2)
        {
            if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"])
            {
                return YES;
            }else
            {
                return NO;
            }
        }else{
            //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
            if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]])
            {
                return YES;
            }
            else
            {
                return NO;
            }
        }
    }
}

//验证邮箱格式是否正确
- (BOOL)regularEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

//是否是手机号
- (BOOL)regularPhoneNum {
    /**
     手机号码 13[0-9],14[5|7|9],15[0-3],15[5-9],17[0|1|3|5|6|8],18[0-9]
     移动：134[0-8],13[5-9],147,15[0-2],15[7-9],178,18[2-4],18[7-8]
     联通：13[0-2],145,15[5-6],17[5-6],18[5-6]
     电信：133,1349,149,153,173,177,180,181,189
     虚拟运营商: 170[0-2]电信  170[3|5|6]移动 170[4|7|8|9],171 联通
     上网卡又称数据卡，14号段为上网卡专属号段，中国联通上网卡号段为145，中国移动上网卡号段为147，中国电信上网卡号段为149
     */
    NSString * MOBIL = @"^1(3[0-9]|4[579]|5[0-35-9]|7[01356]|8[0-9])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBIL];
    if ([regextestmobile evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}

//是否是移动手机号
- (BOOL)regularMovePhoneNum {
    /**
     *  是否是移动号
     * 中国移动：China Mobile
     * 134[0-8],13[5-9],147,15[0-2],15[7-9],170[3|5|6],178,18[2-4],18[7-8]
     */
    NSString * CM = @"^1(34[0-8]|70[356]|(3[5-9]|4[7]|5[0-27-9]|7[8]|8[2-47-8])\\d)\\d{7}$";
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    if ([regextestcm evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}

//是否是联通手机号
- (BOOL)regularLinkPhoneNum {
    /**
     *  是否是联通号
     * 中国联通：China Unicom
     * 13[0-2],145,15[5-6],17[5-6],18[5-6],170[4|7|8|9],171
     */
    NSString * CU = @"^1(70[07-9]|(3[0-2]|4[5]|5[5-6]|7[15-6]|8[5-6])\\d)\\d{7}$";
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    if ([regextestcu evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}

//是否是电信手机号
- (BOOL)regularTelecomPhoneNum {
    /**
     *  是否是电信号
     * 中国电信：China Telecom
     * 133,1349,149,153,173,177,180,181,189,170[0-2]
     */
    NSString * CT = @"^1(34[9]|70[0-2]|(3[3]|4[9]|5[3]|7[37]|8[019])\\d)\\d{7}$";
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    if ([regextestct evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}

//是否是银行卡
- (BOOL)regularBankCard {
    
    NSString *bankCard = self;
    
    if (bankCard.length < 16) {
        return NO;
    }
    NSInteger oddsum = 0;     //奇数求和
    NSInteger evensum = 0;    //偶数求和
    NSInteger allsum = 0;
    NSInteger cardNoLength = (NSInteger)[bankCard length];
    // 取了最后一位数
    NSInteger lastNum = [[bankCard substringFromIndex:cardNoLength-1] intValue];
    //测试的是除了最后一位数外的其他数字
    bankCard = [bankCard substringToIndex:cardNoLength - 1];
    for (NSInteger i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [bankCard substringWithRange:NSMakeRange(i-1, 1)];
        NSInteger tmpVal = [tmpString integerValue];
        if (cardNoLength % 2 ==1 ) {//卡号位数为奇数
            if((i % 2) == 0){//偶数位置
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{//奇数位置
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0)
        return YES;
    else
        return NO;
}

@end
