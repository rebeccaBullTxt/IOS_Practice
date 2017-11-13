//
//  MyCrashHandler.h
//  uTan
//
//  Created by yurong on 13-3-7.
//
//

#import <Foundation/Foundation.h>
#include <libkern/OSAtomic.h>
#include <execinfo.h>

#define CatchException [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"Exception.crash"] 
NSArray * myBacktrace(void);

@interface MyCrashHandler : NSObject
{
    BOOL    dismissed;
}

+ (void)setDefaultHandler;
+ (NSUncaughtExceptionHandler*)getHandler;
@end
