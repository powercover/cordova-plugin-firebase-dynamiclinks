#import "AppDelegate+FirebaseDynamicLinksPlugin.h"
#import "FirebaseDynamicLinksPlugin.h"
#import <objc/runtime.h>


@implementation AppDelegate (FirebaseDynamicLinksPlugin)

+ (void)load {
    method_exchangeImplementations(
        class_getInstanceMethod(self, @selector(application:continueUserActivity:restorationHandler:)),
        class_getInstanceMethod(self, @selector(identity_application:continueUserActivity:restorationHandler:))
    );
}

// [START continueuseractivity]
- (BOOL)identity_application:(UIApplication *)application
        continueUserActivity:(NSUserActivity *)userActivity
          restorationHandler:(void (^)(NSArray *))restorationHandler {
    FirebaseDynamicLinksPlugin* dl = [self.viewController getCommandInstance:@"FirebaseDynamicLinks"];

    BOOL handled = [[FIRDynamicLinks dynamicLinks]
        handleUniversalLink:userActivity.webpageURL
        completion:^(FIRDynamicLink * _Nullable dynamicLink, NSError * _Nullable error) {
            // Try this method as some dynamic links are not recognize by handleUniversalLink
            // ISSUE: https://github.com/firebase/firebase-ios-sdk/issues/743
            dynamicLink = dynamicLink ? dynamicLink
                : [[FIRDynamicLinks dynamicLinks]
                   dynamicLinkFromUniversalLinkURL:userActivity.webpageURL];
            
            if (dynamicLink) {
                [dl postDynamicLink:dynamicLink];
            }
        }];

    if (handled) {
        return YES;
    }

    return [self identity_application:application
                 continueUserActivity:userActivity
                   restorationHandler:restorationHandler];
}
// [END continueuseractivity]

@end
