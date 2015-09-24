//
//  main.m
//  YSHelperExample
//
//  Created by Yu Sugawara on 2014/01/28.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <LumberjackLauncher/LumberjackLauncher.h>

int main(int argc, char * argv[])
{
    @autoreleasepool {
        [LumberjackLauncher launchStandardLoggers];
        [LumberjackLauncher setXcodeConsoleLogColorsWithErrorColor:[UIColor redColor]
                                                      warningColor:[UIColor yellowColor]
                                                         infoColor:[UIColor darkGrayColor]
                                                        debugColor:[UIColor greenColor]
                                                      verboseColor:nil];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
