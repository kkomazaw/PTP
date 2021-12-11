//
//  PTPAppDelegate.h
//  PTP
//
//  Created by 松井 圭司 on 10/05/08.
//  Copyright 大船中央病院 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PTPViewController;

@interface PTPAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PTPViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PTPViewController *viewController;

@end

