//
//  YSHelper.h
//  YSHelperExample
//
//  Created by Yu Sugawara on 2013/02/23.
//  Copyright (c) 2013年 Yu Sugawara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSHelper : NSObject

/* Device */
+ (BOOL)isPhone;
+ (BOOL)isPad;
+ (NSString*)deviceTypeStr; // e.g. @"iPhone", @"iPad"
+ (NSString*)appDisplayName; // ホーム画面に表示されるアプリ名
+ (NSString*)deviceName; // e.g. @"My iPhone"
+ (BOOL)isRetina;
+ (BOOL)is568h;

/* Orientation */
+ (BOOL)isOrientationPortrait;
+ (BOOL)isOrientationLandscape;

/* Language */
+ (BOOL)isJapaneseLanguage;
+ (NSString*)currentLanguage; // e.g. @"ja", @"en"
+ (NSString*)currentISOCountryCode; // e.g. @"JP", @"US"

/* Image */
+ (UIImage*)appIcon;

/* Function */
+ (BOOL)hasAirDrop;

/* Version */
+ (BOOL)isGreaterThanThisSystemVersion:(NSString*)version; // versionより大きい
+ (BOOL)isGreaterThanOrEqualToThisSystemVersion:(NSString*)version; // version以上
+ (BOOL)isSmallerThanOrEqualToThisSystemVersion:(NSString*)version; // version以下
+ (BOOL)isSmallerThanThisSystemVersion:(NSString*)version; // version未満

/* ViewController */
+ (UIViewController*)visibleViewController;

/* Appearance */
+ (void)reloadAppearance;

/* Status bar */
+ (CGSize)statusBarSizeToConsideredTheRotation;

/* Jailbreak */
+ (BOOL)isJailbroken;

@end