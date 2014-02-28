//
//  NetworkAccessClassTests.m
//  OCTestTemplate
//
//  Created by Hiroyuki Onishi on 2/28/14.
//  Copyright (c) 2014 Hiroyuki Onishi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NetworkAccessClass.h"

@interface NetworkAccessClassTests : XCTestCase

@end

@implementation NetworkAccessClassTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

//- (void)testExample
//{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
//}

#pragma mark - Test utilities

- (NetworkAccessClass *)defaultNetworkAccess
{
    return [[NetworkAccessClass alloc] init];
}

#pragma mark - Tests

- (void)testRequestLiveStatus
{
    NetworkAccessClass *networkAccess = [self defaultNetworkAccess];

    [networkAccess requestLiveStatusWithCompletion:nil];
    // [networkAccess requs]
}

@end
