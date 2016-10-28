//
//  SampleClass.h
//  SampleClass
//
//  Created by Keisuke Kagoshima on 2016/10/28.
//  Copyright © 2016年 ca5. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for SampleClass.
FOUNDATION_EXPORT double SampleClassVersionNumber;

//! Project version string for SampleClass.
FOUNDATION_EXPORT const unsigned char SampleClassVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <SampleClass/PublicHeader.h>

//外部callback用blocks
typedef void (^UserDefaultCompletionHandler)(NSString *);

//内部callback用delegate
@protocol UserDefaultDelegate<NSObject>
- (void)receiveUserDefault:(NSString *)str;
@end

//外部callback用delegate
@protocol SampleClassDelegate<NSObject>
@required
- receiveString:(NSString *)str;
@end

@interface SampleClass<UserDefaultDelegate> : NSObject
- (instancetype)initWithSampleClassDelegate:(id)delegate;
- (void)setUserDefault:(NSString *)str;
- (NSString *)getUserDefault;
- (void)getUserDefaultAsyncWithCompletionHandle:(UserDefaultCompletionHandler)completionHandler;
- (void)getUserDefaultAsync;
@end
