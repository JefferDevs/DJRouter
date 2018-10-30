//
//  ThirdViewController.m
//  JDRouterDemo
//
//  Created by jdq on 2018/10/29.
//  Copyright © 2018 JefferDevs. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)backButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:true];
}

@end
