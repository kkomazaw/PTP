//
//  PTPAppDelegate.m
//  PTP
//
//  Created by 松井 圭司 on 10/05/08.
//  Copyright 大船中央病院 2010. All rights reserved.
//

#import "PTPAppDelegate.h"
#import "PTPViewController.h"

@implementation PTPAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
