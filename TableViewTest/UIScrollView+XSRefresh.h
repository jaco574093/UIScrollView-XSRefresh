//
//  UIScrollView+XSRefresh.h
//  TableViewTest
//
//  Created by xisi on 2019/9/8.
//  Copyright © 2019 xisi. All rights reserved.
//

#import <UIKit/UIKit.h>

//  采用预加载技术
@interface UIScrollView (XSRefresh)

//  注意循环引用
@property (nonatomic) void (^topRefreshBlock)(void);            //  刷新
@property (nonatomic) void (^bottomRefreshBlock)(void);         //  加载更多

@end
