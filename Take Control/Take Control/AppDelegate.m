//
//  AppDelegate.m
//  Take Control
//
//  Created by Dave Albert on 27/03/2013.
//  Copyright (c) 2013 Moodocity Ltd. All rights reserved.
//

#import "AppDelegate.h"

#import "LoginViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      self.viewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController_iPhone" bundle:nil];
  } else {
      self.viewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController_iPad" bundle:nil];
  }
  self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
