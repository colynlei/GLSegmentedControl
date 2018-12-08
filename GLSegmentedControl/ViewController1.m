//
//  ViewController1.m
//  GLSegmentedControl
//
//  Created by 雷国林 on 2018/12/7.
//  Copyright © 2018 雷国林. All rights reserved.
//

#import "ViewController1.h"
#import "GLSegmentedControl.h"

@interface ViewController1 ()

@property (nonatomic, strong) GLSegmentedControl *segmentedControl;

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.segmentedControl];

}

- (GLSegmentedControl *)segmentedControl {
    if (!_segmentedControl) {
        _segmentedControl = [[GLSegmentedControl alloc] initWithFrame:self.view.bounds titles:@[@"中华人民共和国",@"北京市",@"海淀区",@"西二旗",@"西二旗中路",@"北京火币天下网络科技有限公司"]];
        _segmentedControl.titleLeft = 16;
        _segmentedControl.titleRight = 16;
        _segmentedControl.titleGap = 20;
        _segmentedControl.lineViewSize = CGSizeMake(0, 5);
        _segmentedControl.selectedFont = kFont_Medium(18);
        _segmentedControl.selectedColor = [UIColor redColor];
        _segmentedControl.backgroundColor = [UIColor yellowColor];
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
