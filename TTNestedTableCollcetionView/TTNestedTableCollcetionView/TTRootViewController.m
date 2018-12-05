//
//  TTRootViewController.m
//  TTNestedTableCollcetionView
//
//  Created by 宁小陌 on 2018/12/5.
//  Copyright © 2018 宁小陌. All rights reserved.
//

#import "TTRootViewController.h"
#import "TTFixedTableViewCell.h"
#import "TTTBImitationViewController.h"

#define K_T_Cell @"t_cell"
#define K_C_Cell @"c_cell"
@interface TTRootViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableDictionary *heightAtIndexPath;
@end

@implementation TTRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"嵌套使用";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    self.dataArray = @[@[@"1元", @"2元", @"3元", @"4元", @"5元", @"6元"],
                     @[@"1元", @"2元", @"3元", @"4元", @"10元", @"20元", @"30元", @"40元", @"11元", @"22元", @"33元"]];
    [self.view addSubview:self.tableView];
}

#pragma mark ====== UITableViewDelegate ======
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count + 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.heightAtIndexPath[indexPath]) {
        NSNumber *num = self.heightAtIndexPath[indexPath];
        return [num floatValue];
    } else {
        return 60;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.dataArray.count) {
        [tableView registerClass:[TTRootTableCell class] forCellReuseIdentifier:K_C_Cell];
        TTRootTableCell *cell = [tableView dequeueReusableCellWithIdentifier:K_C_Cell forIndexPath:indexPath];
        cell.delegate = self;
        cell.indexPath = indexPath;
        cell.dataArray = self.dataArray[indexPath.row];
        return cell;
    } else {
        [tableView registerClass:[TTFixedTableViewCell class] forCellReuseIdentifier:K_T_Cell];
        TTFixedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:K_T_Cell forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
}

#pragma mark ====== RootTableCellDelegate ======
- (void)updateTableViewCellHeight:(TTRootTableCell *)cell andheight:(CGFloat)height andIndexPath:(NSIndexPath *)indexPath {
    if (![self.heightAtIndexPath[indexPath] isEqualToNumber:@(height)]) {
        self.heightAtIndexPath[indexPath] = @(height);
        [self.tableView reloadData];
    }
}

//点击UICollectionViewCell的代理方法
- (void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath withContent:(NSString *)content {
    TTTBImitationViewController *vc = [[TTTBImitationViewController alloc] init];
    vc.contentStr = content;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark ====== init ======
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableDictionary *)heightAtIndexPath {
    if (!_heightAtIndexPath) {
        _heightAtIndexPath = [[NSMutableDictionary alloc] init];
    }
    return _heightAtIndexPath;
}

@end
