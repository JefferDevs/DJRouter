//
//  AppDelegate+Router.m
//  JDRouterDemo
//
//  Created by jdq on 2018/10/29.
//  Copyright © 2018 JefferDevs. All rights reserved.
//

#import "AppDelegate+Router.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@implementation AppDelegate (Router)

- (void)configRoutersToController
{
    [[DJRouter shared] registerRouter:Router_Second toControllerClass:[SecondViewController class]];
    [[DJRouter shared] registerRouter:Router_Third toControllerClass:[ThirdViewController class]];
}

@end
