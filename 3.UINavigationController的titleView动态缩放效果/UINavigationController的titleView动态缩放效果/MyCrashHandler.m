//
//  MyCrashHandler.m
//  uTan
//
//  Created by yurong on 13-3-7.
//
//

#import "MyCrashHandler.h"
#import <UIKit/UIKit.h>
#import "hcLocalizedString.h"
#ifdef ENABLE_DEBUG_SANDBOX
#define LOG(args...)  NSLog(@"%s%d行:%@\n",__FUNCTION__,__LINE__,[NSString stringWithFormat:args]);
#else
#define LOG(args...)
#endif

NSString * const UncaughtExceptionHandlerSignalExceptionName = @"UncaughtExceptionHandlerSignalExceptionName";
NSString * const UncaughtExceptionHandlerSignalKey = @"UncaughtExceptionHandlerSignalKey";
NSString * const UncaughtExceptionHandlerAddressesKey = @"UncaughtExceptionHandlerAddressesKey";
volatile int32_t UncaughtExceptionCount = 0;
const int32_t UncaughtExceptionMaximum = 10;
const NSInteger UncaughtExceptionHandlerSkipAddressCount = 4;
const NSInteger UncaughtExceptionHandlerReportAddressCount = 5;

void UncaughtExceptionHandler(NSException *exception);
NSString* getAppInfo();

#pragma mark - uncaught exception handler
NSArray * myBacktrace()
{
    void* callstack[128];
    int frames = backtrace(callstack, 128);
    char **strs = backtrace_symbols(callstack, frames);
    int i;
    
    NSMutableArray *backtrace = [NSMutableArray arrayWithCapacity:frames];
    
//    for (
//         i = UncaughtExceptionHandlerSkipAddressCount;
//         i < UncaughtExceptionHandlerSkipAddressCount +
//         UncaughtExceptionHandlerReportAddressCount;
//         i++)
    for ( i = 0; i < frames; i++)
    {
        [backtrace addObject:[NSString stringWithUTF8String:strs[i]]];
    }
    
    free(strs);
    
    return backtrace;
}

void UncaughtExceptionHandler(NSException *exception) {
    NSArray *arr = [exception callStackSymbols];  //[arr componentsJoinedByString:@"\n"],
    NSString *reason = [exception reason];
    
//    NSArray * arrBacktrace = myBacktrace();
    
//    NSString *name = [exception name];
    
//    NSString *url = [NSString stringWithFormat:@"崩溃类名:\n%@\n崩溃原因:\n%@\n栈使用:\n%@",
//                     name,reason,[arr componentsJoinedByString:@"\n"]];
    
    NSString *url = [NSString stringWithFormat:@"崩溃原因:\n%@:\n%@\n其他信息:\n%@",
                     reason,
                     getAppInfo(),
                     [arr componentsJoinedByString:@"\n"]];
    
    LOG(@"%@", url);
    
    NSString * newurl = [url stringByReplacingOccurrencesOfString:@"\n" withString:@"<br/>"];
    [newurl writeToFile:CatchException atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

#pragma mark - signal exception handler
NSString* getAppInfo()
{
    NSString *appInfo = [NSString stringWithFormat:@"App : %@ %@(%@)\nDevice : %@\nOS Version : %@ %@\nUDID : %@\n", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"], [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"], [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"],[UIDevice currentDevice].model , [UIDevice currentDevice].systemName, [UIDevice currentDevice].systemVersion, [UIDevice currentDevice].identifierForVendor];
    //[UIDevice currentDevice].model
    return appInfo;
}

void MySignalHandler(int signal)
{
    int32_t exceptionCount = OSAtomicIncrement32(&UncaughtExceptionCount);
    
    if (exceptionCount > UncaughtExceptionMaximum) {
        return;
    }
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithObject:[NSNumber numberWithInt:signal] forKey:UncaughtExceptionHandlerSignalKey];
    
    NSArray *callStack = myBacktrace();

    [userInfo setObject:callStack forKey:UncaughtExceptionHandlerAddressesKey];
    
    [[[MyCrashHandler alloc] init] performSelectorOnMainThread:@selector(handleException:) withObject:[NSException exceptionWithName:UncaughtExceptionHandlerSignalExceptionName reason:[NSString stringWithFormat: hcLocalizedString(@"Signal %d was raised.\n" @"%@", nil), signal, getAppInfo()] userInfo: [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:signal] forKey:UncaughtExceptionHandlerSignalKey]] waitUntilDone:YES];
}

void InstallUncaughtExceptionHandler(){
//    signal(SIGHUP, MySignalHandler);
//    signal(SIGINT, MySignalHandler);
//    signal(SIGQUIT, MySignalHandler);
    signal(SIGABRT, MySignalHandler);
    signal(SIGILL, MySignalHandler);
    signal(SIGSEGV, MySignalHandler);
    signal(SIGFPE, MySignalHandler);
    signal(SIGBUS, MySignalHandler);
    signal(SIGPIPE, MySignalHandler);
}


@implementation MyCrashHandler

//-(NSString *)applicationDocumentsDirectory {
//    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//}

- (void)alertView:(UIAlertView *)anAlertView clickedButtonAtIndex:(NSInteger)anIndex
{
    if (anIndex == 0)
    {
        dismissed = YES;
    }
}

- (void)handleException:(NSException *)exception
{
    UncaughtExceptionHandler(exception);
    
//    UIAlertView *alert =
//    [[UIAlertView alloc]
//      initWithTitle:hcLocalizedString(@"Unhandled exception", nil)
//      message:[NSString stringWithFormat:hcLocalizedString(
//                                                           @"You can try to continue but the application may be unstable.\n"
//                                                           @"%@\n%@", nil),
//               [exception reason],
//               [[exception userInfo] objectForKey:UncaughtExceptionHandlerAddressesKey]]
//     
//      delegate:self
//      cancelButtonTitle:hcLocalizedString(@"Quit", nil)
//      otherButtonTitles:hcLocalizedString(@"Continue", nil), nil];
//    
//    [alert show];
    
    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
    CFArrayRef allModes = CFRunLoopCopyAllModes(runLoop);
    
    while (!dismissed) {
        for (NSString *mode in (__bridge NSArray *)allModes)
        {
            CFRunLoopRunInMode((__bridge CFStringRef)mode, 0.001, false);
        }
        
        dismissed = YES;
    }

    CFRelease(allModes);
    
    NSSetUncaughtExceptionHandler(NULL);
    
    signal(SIGABRT, SIG_DFL);
    signal(SIGILL, SIG_DFL);
    signal(SIGSEGV, SIG_DFL);
    signal(SIGFPE, SIG_DFL);
    signal(SIGBUS, SIG_DFL);
    signal(SIGPIPE, SIG_DFL);
    
    if ([[exception name] isEqual:UncaughtExceptionHandlerSignalExceptionName])
    {
        kill(getpid(), [[[exception userInfo] objectForKey:UncaughtExceptionHandlerSignalKey] intValue]);
    }
    else
    {
        [exception raise];
    }
}

#pragma mark - class method
+ (void)setDefaultHandler
{
    NSSetUncaughtExceptionHandler (&UncaughtExceptionHandler);
//    InstallUncaughtExceptionHandler ();
}

+ (NSUncaughtExceptionHandler*)getHandler
{
    return NSGetUncaughtExceptionHandler();
}

@end
