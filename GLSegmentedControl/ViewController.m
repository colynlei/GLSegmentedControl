//
//  ViewController.m
//  GLSegmentedControl
//
//  Created by 雷国林 on 2018/12/7.
//  Copyright © 2018 雷国林. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btn1Action:(UIButton *)sender {
    [self.navigationController pushViewController:[[ViewController1 alloc]init] animated:YES];
}

- (IBAction)btn2Action:(UIButton *)sender {
    [self.navigationController pushViewController:[[ViewController2 alloc]init] animated:YES];

}
- (IBAction)btn3Action:(UIButton *)sender {
    [self.navigationController pushViewController:[[ViewController3 alloc]init] animated:YES];

}

@end
