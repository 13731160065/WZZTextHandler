//
//  WZZTextHandler.h
//  WZZTextHandlerDemo
//
//  Created by wyq_iMac on 2019/5/10.
//  Copyright © 2019 wzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WZZTextCheckConfig.h"

@interface WZZTextHandler : NSObject

/**
 使用配置文件进行检查

 @param config 配置文件
 @param string 检查字符串
 @return 是否符合
 */
+ (BOOL)checkTextWithConfig:(WZZTextCheckConfig *)config
                     string:(NSString *)string;

/**
 使用多个配置文件进行检查，配置文件间为”或“

 @param configs 配置文件数组
 @param string 检查字符串
 @return 是否符合
 */
+ (BOOL)checkTextWithOrConfigs:(NSArray <WZZTextCheckConfig *>*)configs
                        string:(NSString *)string;

/**
 使用多个配置文件进行检查，配置文件间为”与“
 
 @param configs 配置文件数组
 @param string 检查字符串
 @return 是否符合
 */
+ (BOOL)checkTextWithAndConfigs:(NSArray <WZZTextCheckConfig *>*)configs
                         string:(NSString *)string;

@end
