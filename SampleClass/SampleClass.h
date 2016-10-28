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


typedef void (^UserDefaultCompletionHandler)(NSString *);

@interface SampleClass : NSObject
- (void)initWithUserDefaultCompletionHandler: (UserDefaultCompletionHandler *)handler;
- (void)setUserDefault:(NSString *)str;
- (NSString *)getUserDefault;
- (void)getUserDefaultAsyncWithCompletionHandle:(UserDefaultCompletionHandler)completionHandler;

@end
