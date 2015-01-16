//
//  YSHelperExampleTests.m
//  YSHelperExampleTests
//
//  Created by Yu Sugawara on 2014/01/28.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YSHelper.h"
#import <objc/runtime.h>

#if defined(LOG_ASYNC_ENABLED)
#undef LOG_ASYNC_ENABLED
#define LOG_ASYNC_ENABLED NO
#endif

static NSString * const kCustumSystemVersion = @"custumSystemVersion";

@interface UIDevice (YSHelperTest)

@property (nonatomic) NSString *custumSystemVersion;

@end

@implementation UIDevice (YSHelperTest)

- (NSString *)custumSystemVersion
{
    return objc_getAssociatedObject(self, (__bridge const void *)(kCustumSystemVersion));
}

- (void)setCustumSystemVersion:(NSString *)version
{
    objc_setAssociatedObject(self, (__bridge const void *)(kCustumSystemVersion), version, OBJC_ASSOCIATION_RETAIN);
}

@end


@interface YSHelperExampleTests : XCTestCase

@end

@implementation YSHelperExampleTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAppIcon
{
    UIImage *image = [YSHelper appIcon];
    XCTAssertNotNil(image);
    NSLog(@"%s; imageSize = %@;", __func__, NSStringFromCGSize(image.size));
}

- (void)testCompareOSVersion
{
    Method fromMethod = class_getInstanceMethod([UIDevice class], @selector(systemVersion));
    Method toMethod   = class_getInstanceMethod([UIDevice class], @selector(custumSystemVersion));
    method_exchangeImplementations(fromMethod, toMethod);
    
    UIDevice *device = [UIDevice currentDevice];
    
    NSString *version = @"5.5.0";
    device.custumSystemVersion = version;
    XCTAssertEqualObjects(device.systemVersion, version);
    
    // バージョンより大きい
    XCTAssertFalse([YSHelper isGreaterThanThisSystemVersion:@"1.0.0"]);
    XCTAssertFalse([YSHelper isGreaterThanThisSystemVersion:@"5.4.9"]);
    XCTAssertFalse([YSHelper isGreaterThanThisSystemVersion:@"5.5.0"]);
    XCTAssertTrue([YSHelper isGreaterThanThisSystemVersion:@"5.5.1"]);
    XCTAssertTrue([YSHelper isGreaterThanThisSystemVersion:@"6.0.0"]);
    
    // バージョン以上
    XCTAssertFalse([YSHelper isGreaterThanOrEqualToThisSystemVersion:@"1.0.0"]);
    XCTAssertFalse([YSHelper isGreaterThanOrEqualToThisSystemVersion:@"5.4.9"]);
    XCTAssertTrue([YSHelper isGreaterThanOrEqualToThisSystemVersion:@"5.5.0"]);
    XCTAssertTrue([YSHelper isGreaterThanOrEqualToThisSystemVersion:@"5.5.1"]);
    XCTAssertTrue([YSHelper isGreaterThanOrEqualToThisSystemVersion:@"6.0.0"]);
    
    // バージョン以下
    XCTAssertTrue([YSHelper isSmallerThanOrEqualToThisSystemVersion:@"1.0.0"]);
    XCTAssertTrue([YSHelper isSmallerThanOrEqualToThisSystemVersion:@"5.4.9"]);
    XCTAssertTrue([YSHelper isSmallerThanOrEqualToThisSystemVersion:@"5.5.0"]);
    XCTAssertFalse([YSHelper isSmallerThanOrEqualToThisSystemVersion:@"5.5.1"]);
    XCTAssertFalse([YSHelper isSmallerThanOrEqualToThisSystemVersion:@"6.0.0"]);
    
    // バージョン未満
    XCTAssertTrue([YSHelper isSmallerThanThisSystemVersion:@"1.0.0"]);
    XCTAssertTrue([YSHelper isSmallerThanThisSystemVersion:@"5.4.9"]);
    XCTAssertFalse([YSHelper isSmallerThanThisSystemVersion:@"5.5.0"]);
    XCTAssertFalse([YSHelper isSmallerThanThisSystemVersion:@"5.5.1"]);
    XCTAssertFalse([YSHelper isSmallerThanThisSystemVersion:@"6.0.0"]);
    
    method_exchangeImplementations(toMethod, fromMethod);
}

@end
