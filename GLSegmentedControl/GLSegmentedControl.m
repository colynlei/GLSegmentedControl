//
//  GLSegmentedControl.m
//  GLSegmentedControl
//
//  Created by 雷国林 on 2018/12/7.
//  Copyright © 2018 雷国林. All rights reserved.
//

#import "GLSegmentedControl.h"
#import <YYKit.h>

#define Title_tag 39572339

@interface GLSegmentedControl ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *lineView;
@property (nonatomic, strong) UILabel *selectedTitleLabel;
@property (nonatomic, strong) NSMutableArray *titleLabelWArray;

@end

@implementation GLSegmentedControl

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray<NSString *> * _Nonnull)titles {
    self = [super initWithFrame:frame];
    if (self) {
        
        
        [self initDefault];
        [self addsubviews];
        
        self.titles = titles;
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame titles:@[]];
}

- (void)initDefault {
    _lineViewSize = CGSizeMake(0, 5);
    _lineViewBackgroundColor = [UIColor greenColor];
    _lineViewAnimationDuration = 0.25;
    
    _selectedIndex = 0;
    _titleLeft = 0;
    _titleRight = 0;
    _titleGap = 10;
    _titleGapType = GLSegmentedControlTitleGapTypeDefault;
    
    _selectedFont = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
    _selectedColor = [UIColor colorWithHexString:@"#0DBDC9"];
    
    _normalFont = [UIFont systemFontOfSize:14];
    _normalColor = [UIColor colorWithHexString:@"#404B69"];
}

- (void)addsubviews {
    [self addSubview:self.scrollView];
    [self.scrollView addSubview:self.lineView];
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

- (UIImageView *)lineView {
    if (!_lineView) {
        _lineView = [[UIImageView alloc] init];
        _lineView.backgroundColor = [UIColor greenColor];
    }
    return _lineView;
}

- (NSMutableArray *)titleLabelWArray {
    if (!_titleLabelWArray) {
        _titleLabelWArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _titleLabelWArray;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    UILabel *label = [self.scrollView viewWithTag:Title_tag+selectedIndex];
    if (label) {
        [self currentSelectedTitleLabel:label];
    }
}

- (void)setTitles:(NSArray<NSString *> *)titles {
    _titles = titles;
    
    if (!titles || !titles.count) return;
    
    for (NSInteger i = 0; i < titles.count; i++) {
        
        UILabel *label = [self.scrollView viewWithTag:Title_tag+i];
        if (!label) {
            label = [[UILabel alloc] init];
            label.tag = Title_tag+i;
            label.userInteractionEnabled = YES;
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleAction:)];
            [label addGestureRecognizer:tap];
        }
        label.text = titles[i];
        [self.scrollView addSubview:label];
    }
    [self setNeedsLayout];
}

- (void)titleAction:(UITapGestureRecognizer *)tap {
    UILabel *label = (UILabel *)tap.view;
    if (label == self.selectedTitleLabel) return;
    [self currentSelectedTitleLabel:label];
}

- (void)currentSelectedTitleLabel:(UILabel *)label {
    if (label == nil) return;
    self.selectedTitleLabel.font = self.normalFont;
    self.selectedTitleLabel.textColor = self.normalColor;
    self.selectedTitleLabel = label;
    self.selectedTitleLabel.font = self.selectedFont;
    self.selectedTitleLabel.textColor = self.selectedColor;
    
    [self reloadFrame];

}

- (void)reloadFrame {
    
    [self.titleLabelWArray removeAllObjects];
    CGFloat all_w = 0;//计算出所有字体的宽度
    for (NSInteger i = 0; i < self.titles.count; i++) {
        UILabel *label = [self.scrollView viewWithTag:Title_tag+i];
        if (label) {
            CGFloat w = [label.text widthForFont:label.font];
            [self.titleLabelWArray addObject:@(w)];
            all_w += w;
        }
    }
    
    CGFloat gap = self.titleGap;
    CGFloat left = self.titleLeft;
    CGFloat right = self.titleRight;

    switch (self.titleGapType) {
        case GLSegmentedControlTitleGapTypeDefault:
            break;
        case GLSegmentedControlTitleGapTypeEqualGapBoth:
        {
            
            if (all_w > self.width) {
                NSLog(@"所有字体总宽度大于当前视图所容许宽");
            } else {
                gap = (self.width-all_w)/(self.titles.count+1);
                left = gap;
                right = gap;
            }
        }
            break;
        case GLSegmentedControlTitleGapTypeEqualGapWithoutBoth:
        {
            if (all_w > self.width-left-right) {
                NSLog(@"所有字体总宽度大于当前视图所容许宽度");
            } else {
                gap = (self.width-all_w-left-right)/(self.titles.count-1);
            }
        }
            break;
            
        default:
            break;
    }
    
    for (NSInteger i = 0; i < self.titles.count; i++) {
        UILabel *label = [self.scrollView viewWithTag:Title_tag+i];
        if (label) {
            CGFloat x = left;
            CGFloat w = [self.titleLabelWArray[i] floatValue];
            if (i > 0) {
                UILabel *lastLabel = [self.scrollView viewWithTag:Title_tag+i-1];
                x = lastLabel.frame.origin.x+lastLabel.width+gap;
            }
            
            label.frame = CGRectMake(x, 0, w, self.scrollView.height);
            
            if (i == self.titles.count-1) {
                self.scrollView.contentSize = CGSizeMake(label.frame.origin.x+w+right, self.scrollView.height);
            }
        }
    }
    
    CGFloat h = self.lineViewSize.height;
    CGFloat x = self.lineViewSize.width==0?self.selectedTitleLabel.frame.origin.x:(self.selectedTitleLabel.centerX-self.lineViewSize.width/2);
    CGFloat y = self.height-h;
    CGFloat w = self.lineViewSize.width==0?self.selectedTitleLabel.width:self.lineViewSize.width;
    NSTimeInterval duration = self.lineView.origin.y == 0?0:self.lineViewAnimationDuration;
    [UIView animateWithDuration:duration animations:^{
        self.lineView.frame = CGRectMake(x, y, w, h);
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.scrollView bringSubviewToFront:self.lineView];
    self.scrollView.frame = self.bounds;
    for (NSInteger i = 0; i < self.titles.count; i++) {
        UILabel *label = [self.scrollView viewWithTag:Title_tag+i];
        if (label) {
            label.textColor = self.normalColor;
            label.font = self.normalFont;
        }
    }
    [self setSelectedIndex:self.selectedIndex];
}

@end
