//
//  SecondViewController.m
//  JDRouterDemo
//
//  Created by jdq on 2018/10/29.
//  Copyright © 2018 JefferDevs. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic, strong) DJRouter *router;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"router: %@, params: %@", self.route, self.params);
}

- (IBAction)jumpToC:(id)sender
{
    UIViewController *controller = [self.router matchControllerWithStoryboardName:kMainStoryboard route:Router_Third];
    [self.navigationController pushViewController:controller animated:true];
}

- (IBAction)backToA:(id)sender
{
    if ([DJRouter shared].callback) {
        [DJRouter shared].callback(self.route, @{@"id":@(1), @"vc":@"second"});
    }
    [self.navigationController popViewControllerAnimated:true];
}

#pragma mark - Getter

- (DJRouter *)router
{
    if (!_router) {
        _router = [DJRouter shared];
    }
    return _router;
}

@end
