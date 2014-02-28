//
//  NetworkAccessClassTests.m
//  OCTestTemplate
//
//  Created by Hiroyuki Onishi on 2/28/14.
//  Copyright (c) 2014 Hiroyuki Onishi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <XCTAsyncTestCase/XCTAsyncTestCase.h>
#import <OCMock/OCMock.h>
#import "NetworkAccessClass.h"

@interface NetworkAccessClassTests : XCTAsyncTestCase

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

- (void)requestLiveStatus
{
    NetworkAccessClass *networkAccess = [self defaultNetworkAccess];

    [self prepare];

    [networkAccess requestLiveStatusWithCompletion:^(BOOL isLive, NSError *error) {
         NSLog(@"received callback w/ isLive %d.", isLive);
         [self notify:kXCTUnitWaitStatusSuccess];
     }];

    [self waitForStatus:kXCTUnitWaitStatusSuccess timeout:2.0f];
}

- (void)testAsync
{
    [self requestLiveStatus];
}

- (void)testAsyncUsingMock
{
    // code taken from http://stackoverflow.com/a/20663781
    NSString *json = @"{\"islive\":1}";
    NSDictionary *serverResponse = @{@"response" : [[NSHTTPURLResponse alloc] initWithURL:nil statusCode:200 HTTPVersion:nil headerFields:@{}],
                                     @"data" : [json dataUsingEncoding:NSUTF8StringEncoding]};

    id connectionMock = [OCMockObject mockForClass:NSURLConnection.class];
    void (^ proxyBlock)(NSInvocation *) = ^(NSInvocation *invocation) {
        void (^ handler)(NSURLResponse *, NSData *, NSError *);
        [invocation getArgument:&handler atIndex:4];    // see the comments below
        handler(serverResponse[@"response"], serverResponse[@"data"], serverResponse[@"error"]);
    };

    [[[connectionMock stub] andDo:proxyBlock] sendAsynchronousRequest:OCMOCK_ANY      // argument index start from #2 (#0 -> self, #1 -> _cmd)
                                                                queue:OCMOCK_ANY      // #3
                                                    completionHandler:OCMOCK_ANY];    // #4, use this completion in proxyBlock

    [self requestLiveStatus];
}

@end
