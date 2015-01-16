//
//  main.m
//  YSHelperExample
//
//  Created by Yu Sugawara on 2014/01/28.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        DDTTYLogger *logger = [DDTTYLogger sharedInstance];
        [DDLog addLogger:logger];
        [logger setColorsEnabled:YES];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
