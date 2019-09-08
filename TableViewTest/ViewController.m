//
//  ViewController.m
//  TableViewTest
//
//  Created by xisi on 2019/9/8.
//  Copyright © 2019 xisi. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "UIScrollView+XSRefresh.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate> {
    UITableView *_tableView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self getFuncs];
    
    _tableView = [UITableView new];
    [self.view addSubview:_tableView];
    _tableView.frame = self.view.frame;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
    _tableView.backgroundColor = [UIColor redColor];
    _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    _tableView.contentInset = UIEdgeInsetsMake(400, 0, 0, 0);
    

    _tableView.topRefreshBlock = ^{
        puts(">>> topRefreshBlock");
    };
    _tableView.bottomRefreshBlock = ^{
        puts(">>> bottomRefreshBlock");
    };
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView setContentOffset:CGPointMake(0, -100) animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    cell.textLabel.text = [NSString stringWithFormat:@"row - %ld", indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}


//- (void)getFuncs {
//    unsigned int count = 0;
//    Method *methods = class_copyMethodList([UIScrollView class], &count);
//    for (int i = 0; i < count; i++) {
//        Method m = methods[i];
//        const char *name = sel_getName(method_getName(m));
//        const char *encoding = method_getTypeEncoding(m);
//        puts(name);
//        puts(encoding);
//    }
//}

@end
