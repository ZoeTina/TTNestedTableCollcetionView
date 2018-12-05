//
//  TTRootViewController.h
//  TTNestedTableCollcetionView
//
//  Created by 宁小陌 on 2018/12/5.
//  Copyright © 2018 宁小陌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTRootTableCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface TTRootViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, TTRootCellDelegate>

@end

NS_ASSUME_NONNULL_END
