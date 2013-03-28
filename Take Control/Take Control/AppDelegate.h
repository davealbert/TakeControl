//
//  AppDelegate.h
//  Take Control
//
//  Created by Dave Albert on 27/03/2013.
//  Copyright (c) 2013 Moodocity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) LoginViewController *viewController;

@end
