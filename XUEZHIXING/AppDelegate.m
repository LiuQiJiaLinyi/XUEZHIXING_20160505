//
//  AppDelegate.m
//  XUEZHIXING
//
//  Created by LiuQiJia on 16/5/3.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import "AppDelegate.h"
#import "MainPageViewController.h"
#import "MyListViewController.h"
#import "ShoppingCartViewController.h"
#import "CriditShopViewController.h"
#import "GroupBuyingViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIWindow * rootWindow = [[UIWindow alloc] init];
    rootWindow.frame = [UIScreen mainScreen].bounds;
    rootWindow.backgroundColor = [UIColor whiteColor];
    UITabBarController * rootTabbarController = [[UITabBarController alloc] init];
    
    
    
    
    MainPageViewController * mainPageVC = [[MainPageViewController alloc] init];
    mainPageVC.tabBarItem.title = @"主页";
    mainPageVC.tabBarItem.image = [UIImage imageNamed:@"团购图标1副本"];
    mainPageVC.tabBarItem.imageInsets = UIEdgeInsetsMake(30, 30, 30, 30);
    UINavigationController * mainPageNav = [[UINavigationController alloc] initWithRootViewController:mainPageVC];
    mainPageNav.navigationBar.barTintColor = [UIColor greenColor];
    
    MyListViewController * mylistVC = [[MyListViewController alloc] init];
    mylistVC.tabBarItem.title = @"我的订单";
    mylistVC.tabBarItem.image = [UIImage imageNamed:@"团购图标2副本"];
    mylistVC.tabBarItem.imageInsets = UIEdgeInsetsMake(30, 30, 30, 30);
    UINavigationController * mylistNav = [[UINavigationController alloc] initWithRootViewController:mylistVC];
    mylistNav.navigationBar.barTintColor = [UIColor greenColor];
    
    
    ShoppingCartViewController * shoppingCartVC = [[ShoppingCartViewController alloc] init];
    shoppingCartVC.tabBarItem.title = @"购物车";
    shoppingCartVC.tabBarItem.image = [UIImage imageNamed:@"团购图标3副本"];
    shoppingCartVC.tabBarItem.imageInsets = UIEdgeInsetsMake(30, 30, 30, 30);
    UINavigationController * shoppingNav = [[UINavigationController alloc] initWithRootViewController:shoppingCartVC];
    shoppingNav.navigationBar.barTintColor = [UIColor greenColor];
   
    
    
    CriditShopViewController * criditVC = [[CriditShopViewController alloc] init];
    criditVC.tabBarItem.title =@"积分商城" ;
    criditVC.tabBarItem.image =[UIImage imageNamed:@"团购图标4副本"];
    criditVC.tabBarItem.imageInsets = UIEdgeInsetsMake(30, 30, 30, 30);
    UINavigationController * criditNav = [[UINavigationController alloc] initWithRootViewController:criditVC];
    criditNav.navigationBar.barTintColor = [UIColor greenColor];
#pragma mark -新加的团购
    GroupBuyingViewController * groupBuying = [[GroupBuyingViewController alloc] init];
    groupBuying.tabBarItem.title =@" 团购商城" ;
    groupBuying.tabBarItem.image = [UIImage imageNamed:@"团购图标3副本"];
    groupBuying.tabBarItem.imageInsets = UIEdgeInsetsMake(30, 30, 30, 30);
    
    UINavigationController * grounpBuyingNav = [[UINavigationController alloc] initWithRootViewController:groupBuying];
    
 
    NSArray * VCArray = @[mainPageNav,mylistNav,shoppingNav,criditNav,grounpBuyingNav];
    
    rootTabbarController.viewControllers = VCArray;
    rootTabbarController.selectedIndex = 0;
    rootWindow.rootViewController = rootTabbarController;
    
    self.window =rootWindow;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
