
//
//  ViewController0.m
//  GLSegmentedControl
//
//  Created by 雷国林 on 2018/12/9.
//  Copyright © 2018 雷国林. All rights reserved.
//

#import "ViewController0.h"
#import "GLSegmentedControl.h"

@interface ViewController0 ()

@property (nonatomic, strong) GLSegmentedControl *segmentedControl;

@end

@implementation ViewController0

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.segmentedControl];
}

- (GLSegmentedControl *)segmentedControl {
    if (!_segmentedControl) {
        _segmentedControl = [[GLSegmentedControl alloc] init];
        _segmentedControl.titles = @[@"北京市",@"海淀区",@"西二旗"];
        _segmentedControl.backgroundColor = [UIColor whiteColor];
        _segmentedControl.titleGapType = GLSegmentedControlTitleGapTypeNone;
    }
    return _segmentedControl;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.segmentedControl.frame = CGRectMake(0, 100, self.view.frame.size.width, 50);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
