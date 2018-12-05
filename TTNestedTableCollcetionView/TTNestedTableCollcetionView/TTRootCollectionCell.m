//
//  TTRootCollectionCell.m
//  TTNestedTableCollcetionView
//
//  Created by 宁小陌 on 2018/12/5.
//  Copyright © 2018 宁小陌. All rights reserved.
//

#import "TTRootCollectionCell.h"
@interface TTRootCollectionCell ()

@property (nonatomic, strong) UILabel *label;

@end
@implementation TTRootCollectionCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.label = [UILabel new];
        _label.textAlignment = NSTextAlignmentCenter;
        self.backgroundView = _label;
        
        self.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1.0];
    }
    return self;
}

- (void)setTextStr:(NSString *)textStr {
    if (_textStr != textStr) {
        _textStr = textStr;
        self.label.text = textStr;
    }
}
@end
