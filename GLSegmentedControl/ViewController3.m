//
//  ViewController3.m
//  GLSegmentedControl
//
//  Created by 雷国林 on 2018/12/8.
//  Copyright © 2018 雷国林. All rights reserved.
//

#import "ViewController3.h"
#import "GLSegmentedControl.h"

@interface ViewController3 ()

@property (nonatomic, strong) GLSegmentedControl *segmentedControl;

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.segmentedControl];
}

- (GLSegmentedControl *)segmentedControl {
    if (!_segmentedControl) {
        _segmentedControl = [[GLSegmentedControl alloc] init];
        _segmentedControl.titles = @[@"中华人民共和国",@"北京市",@"海淀区",@"西二旗"];
        _segmentedControl.backgroundColor = [UIColor whiteColor];
        _segmentedControl.titleGapType = GLSegmentedControlTitleGapTypeEqualGapWithoutBoth;
        _segmentedControl.titleLeft = 16;
        _segmentedControl.titleRight = 16;
        _segmentedControl.lineViewSize = CGSizeMake(50, 2);
        _segmentedControl.selectedFont = kFont_Heavy(20);
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
