//
//  WZZTextHandler.m
//  WZZTextHandlerDemo
//
//  Created by wyq_iMac on 2019/5/10.
//  Copyright © 2019 wzz. All rights reserved.
//

#import "WZZTextHandler.h"

@implementation WZZTextHandler

+ (BOOL)checkTextWithConfig:(WZZTextCheckConfig *)config
                     string:(NSString *)string {
    if (config.checkHasNumber && ![self __matchRegular:@"[0-9]" str:string]) {
        return NO;
    }
    if (config.checkHasLetter && ![self __matchRegular:@"[a-zA-z]" str:string]) {
        return NO;
    }
    if (config.checkHasSymbol && ![self __matchRegular:@"[*^!~@#$%&()_=+`\\-\\[\\]\\\\\\{\\}|;':\",./<>?]" str:string]) {
        return NO;
    }//\u4e00-\u9fa5中文
    if (config.checkNoNil && !string) {
        return NO;
    }
    if (![string isKindOfClass:[NSString class]]) {
        return NO;
    }
    if (config.checkNoLength0 && !string.length) {
        return NO;
    }
    if (config.checkOnlyLetter && [self __matchRegular:@"[^a-zA-z]{1,}" str:string]) {
        return NO;
    }
    if (config.checkOnlyNumber && [self __matchRegular:@"[^0-9]{1,}" str:string]) {
        return NO;
    }
    if (config.checkEqualLength && string.length != config.checkEqualLength.integerValue) {
        return NO;
    }
    if (config.checkMaxLength && string.length > config.checkMaxLength.integerValue) {
        return NO;
    }
    if (config.checkMinLength && string.length < config.checkMinLength.integerValue) {
        return NO;
    }
    if (config.checkUseRegular && ![self __matchRegular:config.checkUseRegular str:string]) {
        return NO;
    }

    return YES;
}

+ (BOOL)checkTextWithOrConfigs:(NSArray <WZZTextCheckConfig *>*)configs
                        string:(NSString *)string{
    for (int i = 0; i < configs.count; i++) {
        WZZTextCheckConfig * config = configs[i];
        BOOL isOK = [self checkTextWithConfig:config string:string];
        if (isOK) {
            return YES;
        }
    }
    return NO;
}

+ (BOOL)checkTextWithAndConfigs:(NSArray <WZZTextCheckConfig *>*)configs
                         string:(NSString *)string{
    for (int i = 0; i < configs.count; i++) {
        WZZTextCheckConfig * config = configs[i];
        BOOL isOK = [self checkTextWithConfig:config string:string];
        if (!isOK) {
            return NO;
        }
    }
    return YES;
}

+ (BOOL)__matchRegular:(NSString *)reg
                 str:(NSString *)str {
    NSRegularExpression * regHandler = [NSRegularExpression regularExpressionWithPattern:reg options:NSRegularExpressionCaseInsensitive error:nil];
    NSTextCheckingResult * result = [regHandler firstMatchInString:str options:NSMatchingReportProgress range:NSMakeRange(0, str.length)];
    NSRange range = result.range;
    return (range.location != NSNotFound);
}

@end
