//
//  SampleClass.m
//  SampleClass
//
//  Created by Keisuke Kagoshima on 2016/10/28.
//  Copyright © 2016年 ca5. All rights reserved.
//

#import "SampleClass.h"

static NSString *const kUserDefaultsKey = @"sample_key";

@interface SampleClass()
@property (copy, nonatomic)UserDefaultCompletionHandler handler;
@property (nonatomic)id delegate;
@end

@implementation SampleClass : NSObject
- (instancetype)initWithSampleClassDelegate:(id)delegate {
  self = [self init];
  self.delegate = delegate;
  return self;
}

- (void)setUserDefault:(NSString *)str {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [ud setObject:str forKey:kUserDefaultsKey];
  [ud synchronize];
}

- (NSString *)getUserDefault {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  return [ud stringForKey:kUserDefaultsKey];
}


- (void)getUserDefaultAsyncWithCompletionHandle:(UserDefaultCompletionHandler)completionHandler {
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                 ^{
                    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
                    [NSThread sleepForTimeInterval:5];
                    completionHandler([ud stringForKey:kUserDefaultsKey]);
                 });
}

- (void)getUserDefaultAsync {
  //delegateつかって非同期処理 → receiveUserDefaultで受ける
  
}

- (void)receiveUserDefault:(NSString *)str{
  [self.delegate receiveUserDefault:str];
}

@end
