//
//  ViewController.m
//  WZZTextHandlerDemo
//
//  Created by wyq_iMac on 2019/5/10.
//  Copyright © 2019 wzz. All rights reserved.
//

#import "ViewController.h"
#import "WZZTextHandler.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WZZTextCheckConfig * config = [WZZTextCheckConfig config];
    config.checkOnlyNumber = YES;
    config.checkEqualLength = @(11);
    
    BOOL b1 = [WZZTextHandler checkTextWithConfig:config string:@"oeijfowj"];
    BOOL b2 = [WZZTextHandler checkTextWithConfig:config string:@"1379h"];
    BOOL b3 = [WZZTextHandler checkTextWithConfig:config string:@"132398"];
    
    NSLog(@"%d, %d, %d", b1, b2, b3);
}


@end
