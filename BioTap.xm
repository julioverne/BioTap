#import <objc/runtime.h>
#import <substrate.h>

#undef HBLogError
#define HBLogError(...)
#define NSLog(...)

@interface SBLockScreenManager : NSObject
- (void)attemptUnlockWithMesa;
@end

%hook SBLockScreenManager
- (void)_authenticationStateChanged:(NSNotification *)arg1
{
	@try {
		if([[arg1 userInfo][@"SBFUserAuthenticationStateWasAuthenticatedKey"] boolValue]) {
			[self attemptUnlockWithMesa];
		}
	} @catch (NSException * e) {
	}
	%orig;
}
%end

