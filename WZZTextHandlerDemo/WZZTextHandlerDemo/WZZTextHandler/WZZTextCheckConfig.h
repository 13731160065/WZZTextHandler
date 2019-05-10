//
//  WZZTextCheckConfig.h
//  WZZTextHandlerDemo
//
//  Created by wyq_iMac on 2019/5/10.
//  Copyright © 2019 wzz. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WZZTextCheckConfig : NSObject

/**
 检查是否包含数字
 */
@property (assign, nonatomic) BOOL checkHasNumber;

/**
 检查是否包含字母
 */
@property (assign, nonatomic) BOOL checkHasLetter;

/**
 检查是否包含符合
 */
@property (assign, nonatomic) BOOL checkHasSymbol;

/**
 检查只有数字
 */
@property (assign, nonatomic) BOOL checkOnlyNumber;

/**
 检查只有字母
 */
@property (assign, nonatomic) BOOL checkOnlyLetter;

/**
 检查不为空
 */
@property (assign, nonatomic) BOOL checkNoNil;

/**
 检查长度不为空
 */
@property (assign, nonatomic) BOOL checkNoLength0;

/**
 检查最小长度
 */
@property (strong, nonatomic) NSNumber * checkMinLength;

/**
 检查最大长度
 */
@property (strong, nonatomic) NSNumber * checkMaxLength;

/**
 检查长度相等
 */
@property (strong, nonatomic) NSNumber * checkEqualLength;

/**
 使用正则检查
 */
@property (strong, nonatomic) NSString * checkUseRegular;

@end

