//
//  AppDelegate.m
//  Butler
//
//  Created by Jackson on 4/15/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  // WIT instantiation
  [Wit sharedInstance].accessToken = @"ZKVSTYO5Y4B5XXXRAOT6IT74JZTDRLN7";
  
  // light status bar.
  [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
  
  // sets up title screens to open.
  NSLog(@"%@", [UIDevice currentDevice].model);
  MainViewController *titleScreen = [[MainViewController alloc] initWithNibName:@"iPhone-ViewController" bundle:nil];
  if( [[UIDevice currentDevice].model  isEqual:@"iPad"] || [[UIDevice currentDevice].model  isEqual:@"iPad Simulator"])
    titleScreen = [[MainViewController alloc] initWithNibName:@"iPad-ViewController" bundle:nil];
  
  UINavigationController *masterNav = [[UINavigationController alloc] initWithRootViewController:titleScreen];
  [self.window setRootViewController:masterNav];
  [masterNav setNavigationBarHidden:YES];
  [self.window makeKeyAndVisible];
  
  
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
