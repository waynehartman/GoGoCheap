//
//  AppDelegate.m
//  GogoCheap
//
//  Created by Wayne Hartman on 7/30/14.
//  Copyright (c) 2014 Wayne Hartman. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
            

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] removeCookiesSinceDate:[NSDate dateWithTimeIntervalSince1970:0]];

    return YES;
}

@end
