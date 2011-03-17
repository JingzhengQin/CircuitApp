//
//  Circuit_1_0AppDelegate.h
//  Circuit_1.0
//
//  Created by Wilson Chin on 3/11/11.
//  Copyright 2011 George Washington University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Circuit_1_0ViewController;

@interface Circuit_1_0AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Circuit_1_0ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Circuit_1_0ViewController *viewController;

@end

