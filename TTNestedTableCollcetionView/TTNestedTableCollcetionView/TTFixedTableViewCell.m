//
//  TTFixedTableViewCell.m
//  TTNestedTableCollcetionView
//
//  Created by 宁小陌 on 2018/12/5.
//  Copyright © 2018 宁小陌. All rights reserved.
//

#import "TTFixedTableViewCell.h"

@implementation TTFixedTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *label = [UILabel new];
        label.frame = CGRectMake(0, 0, 200, 60);
        label.text = @"我是TableViewCell";
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
    }
    return self;
}

@end
