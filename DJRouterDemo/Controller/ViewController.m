//
//  ViewController.m
//  JDRouterDemo
//
//  Created by jdq on 2018/10/29.
//  Copyright © 2018 JefferDevs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) DJRouter *router;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)jumpToB:(id)sender
{
    UIViewController *controller = [self.router matchControllerWithStoryboardName:kMainStoryboard route:Router_Second params:@{@"id":@(0), @"data":@"tempData"}];
    // callBack
    self.router.callback = ^(NSString * _Nonnull route, id  _Nullable params) {
        NSLog(@"route: %@, params:%@", route, params);
    };
    [self.navigationController pushViewController:controller animated:true];
}

- (IBAction)jumpToC:(id)sender
{
    UIViewController *controller = [self.router matchControllerWithStoryboardName:kMainStoryboard route:Router_Third];
    [self.navigationController pushViewController:controller animated:true];
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
