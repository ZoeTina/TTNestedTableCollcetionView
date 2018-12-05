//
//  TTRootTableCell.h
//  TTNestedTableCollcetionView
//
//  Created by 宁小陌 on 2018/12/5.
//  Copyright © 2018 宁小陌. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TTRootTableCell;
@protocol TTRootCellDelegate <NSObject>

/**
 * 动态改变UITableViewCell的高度
 */
- (void)updateTableViewCellHeight:(TTRootTableCell *)cell andheight:(CGFloat)height andIndexPath:(NSIndexPath *)indexPath;


/**
 * 点击UICollectionViewCell的代理方法
 */
- (void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath withContent:(NSString *)content;
@end

@interface TTRootTableCell : UITableViewCell

@property (nonatomic, weak) id<TTRootCellDelegate> delegate;

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) NSArray *dataArray;

@end

NS_ASSUME_NONNULL_END
