//
//  SampleClassTests.m
//  SampleClassTests
//
//  Created by Keisuke Kagoshima on 2016/10/28.
//  Copyright © 2016年 ca5. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SampleClass.h"

@interface SampleClassTests : XCTestCase

@end

@implementation SampleClassTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testUserDefaults {
  
  //Sync
  SampleClass *sample = [SampleClass new];
  [sample setUserDefault:@"hoge"];
  XCTAssertEqualObjects(@"hoge", [sample getUserDefault]);
  
  
  //Async
  [sample setUserDefault:@"fuga"];
  
  //callbackが完了したことを通知するためのexpectation
  XCTestExpectation *userDefaultCompletionExpectation = [self expectationWithDescription:@"UserDefaultCompletionHandler was finished"];
  [sample getUserDefaultAsyncWithCompletionHandle: ^(NSString *str){
    XCTAssertEqualObjects(@"fuga", str);
    [userDefaultCompletionExpectation fulfill]; //expectationへの完了通知
  }];
  
  [self waitForExpectationsWithTimeout:10 handler:^(NSError *error){
    //getUserDefaultAsyncWithCompletionHandleが完了(or 10sec)するまで待つ。
    //後処理が必要であればここに。
  }];
  
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
