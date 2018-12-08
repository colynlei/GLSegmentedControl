
//
//  ViewController0.m
//  GLSegmentedControl
//
//  Created by 雷国林 on 2018/12/9.
//  Copyright © 2018 雷国林. All rights reserved.
//

#import "ViewController0.h"
#import "GLSegmentedControl.h"

@interface ViewController0 ()<UIScrollViewDelegate,GLSegmentedControlDelegate>

@property (nonatomic, strong) GLSegmentedControl *segmentedControl;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *titles;

@end

@implementation ViewController0

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.titles = @[@"北京市",@"海淀区",@"西二旗"];
    
    [self.view addSubview:self.segmentedControl];
    [self.view addSubview:self.scrollView];
    
    for (NSInteger i = 0; i<self.titles.count; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i*kScreenWidth, 0, kScreenWidth, self.scrollView.frame.size.height)];
        label.backgroundColor = kColorRandomAlpha(0.3);
        label.text = [NSString stringWithFormat:@"%ld",i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
        [self.scrollView addSubview:label];
    }
    self.scrollView.contentSize = CGSizeMake(self.titles.count*kScreenWidth, self.scrollView.frame.size.height);
}

- (GLSegmentedControl *)segmentedControl {
    if (!_segmentedControl) {
        _segmentedControl = [[GLSegmentedControl alloc] init];
        _segmentedControl.delegate = self;
        _segmentedControl.titles = self.titles;
        _segmentedControl.backgroundColor = [UIColor whiteColor];
        _segmentedControl.titleGapType = GLSegmentedControlTitleGapTypeNone;
    }
    return _segmentedControl;
}

- (void)segmentedControl:(GLSegmentedControl *)segmentedControl didSelectedIndex:(NSInteger)index {
    [self.scrollView setContentOffset:CGPointMake(index*kScreenWidth, 0) animated:YES];
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 200, kScreenWidth, 150)];
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.segmentedControl.selectedIndex = scrollView.contentOffset.x/kScreenWidth;
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
