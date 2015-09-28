//
//  ViewController.m
//  YSUtilityExample
//
//  Created by Yu Sugawara on 2013/12/31.
//  Copyright (c) 2013年 Yu Sugawara. All rights reserved.
//

#import "ViewController.h"
#import "YSUtility.h"

#define YESorNOString(yesNo) yesNo ? @"YES" : @"NO"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = NSStringFromClass([YSUtility class]);
    [self refresh];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (IBAction)refreshButtonDidPush:(id)sender
{
    [self refresh];
}

- (void)refresh
{
    self.textView.text = [NSString stringWithFormat:@"\
isPhone = %@\n\
isPad = %@\n\
deviceTypeStr = %@\n\
isRetina = %@\n\
is568h = %@\n\
CPU = %@\n\
isOrientationPortrait = %@\n\
isOrientationLandscape = %@\n\
isJapaneseLanguage = %@\n\
currentLanguage = %@\n\
currentISOCountryCode = %@\n\
appDisplayName = %@\n\
deviceName = %@\n\
hasAirDrop = %@\n\
isJailbroken = %@",
                          YESorNOString([YSUtility isPhone]),
                          YESorNOString([YSUtility isPad]),
                          [YSUtility deviceTypeStr],
                          YESorNOString([YSUtility isRetina]),
                          YESorNOString([YSUtility is568h]),
                          [YSUtility CPU64bit] ? @"64bit" : @"32bit",
                          YESorNOString([YSUtility isOrientationPortrait]),
                          YESorNOString([YSUtility isOrientationLandscape]),
                          YESorNOString([YSUtility isJapaneseLanguage]),
                          [YSUtility currentLanguage],
                          [YSUtility currentISOCountryCode],
                          [YSUtility appDisplayName],
                          [YSUtility deviceName],
                          YESorNOString([YSUtility hasAirDrop]),
                          YESorNOString([YSUtility isJailbroken])];
}

@end
