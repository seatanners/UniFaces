//
//  UnicodeKBView.m
//  UniFaces
//
//  Created by seatanners on 1/20/14.
//  Copyright (c) 2014. All rights reserved.
//

#import "UnicodeKBView.h"

@interface UnicodeKBView()
@property (strong, nonatomic) id<ButtonPressListener> receiver;
@property (strong, nonatomic) Preferences* prefs;

- (UIScrollView *)buildScrollView;
- (UIButton *)buildButtonAtIndex:(int)index;
- (UILabel *)buildTopLabel;
- (UILabel *)buildBottomLabel;
@end

@implementation UnicodeKBView : UIView

- (id)initWithFrame:(CGRect)frame withButtonPressListener:(id<ButtonPressListener>)receiver {
    self = [super initWithFrame:frame];
    if (self) {
        self.receiver = receiver;
        
        self.prefs = [[Preferences alloc] init];
        
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
        
        [self addSubview:[self buildTopLabel]];
        [self addSubview:[self buildHideButton]];
        UIScrollView *scrollView = [self buildScrollView];
        for(int i = 0; i < [[self elements] count]; i++) {
            UIButton *btn = [self buildButtonAtIndex:i];
            [scrollView addSubview:btn];
        }
        [self addSubview:scrollView];
        [self addSubview:[self buildBottomLabel]];
    }
    return self;
}

- (UILabel *)buildTopLabel {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 40)];
    
    label.text = @"Unicode Faces";
    label.font = [label.font fontWithSize:26];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    
    return label;
}

- (UILabel *)buildBottomLabel {
    CGRect frame = CGRectMake(0, CGRectGetHeight(self.frame) - 15, CGRectGetWidth(self.frame), 20);
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = @"BSAP © 2015";
    
    label.font = [label.font fontWithSize:10];
    label.textAlignment = NSTextAlignmentRight;
    label.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    
    return label;
}

- (UIScrollView *)buildScrollView {
    CGRect frame = CGRectMake(0, 40, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - 40);
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.frame), [[self elements] count] * 40);
    
    return scrollView;
}

- (UIButton *)buildButtonAtIndex:(int)index {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(0, index * 40, CGRectGetWidth(self.frame), 40);
    [btn setTitle:[self elements][index] forState:UIControlStateNormal];
    
    [btn addTarget:self.receiver
            action:@selector(buttonPressReceived:)
  forControlEvents:UIControlEventTouchUpInside];
    
    [btn addTarget:self
            action:@selector(buttonPressReceived:)
  forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (UIButton *)buildHideButton {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.titleLabel.font = [btn.titleLabel.font fontWithSize:12];
    btn.frame = CGRectMake(CGRectGetWidth(self.frame) - 60, 10, 50, 20);
    [btn setTitle:@"Hide" forState:UIControlStateNormal];
    [btn addTarget:self
            action:@selector(buttonPressReceived:)
  forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (NSArray *)elements {
    return [self.prefs.dictionary valueForKey:@PREFS_KEY_FACES];
}

- (void)buttonPressReceived:(UIButton *)src {
    [self removeFromSuperview];
}

@end
