//
//  SampleClass.m
//  SampleClass
//
//  Created by Keisuke Kagoshima on 2016/10/28.
//  Copyright © 2016年 ca5. All rights reserved.
//

#import "SampleClass.h"

static NSString *const kUserDefaultsKey = @"sample_key";

@implementation SampleClass : NSObject

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



@end
