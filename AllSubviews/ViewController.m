//
//  ViewController.m
//  AllSubviews
//
//  Created by beijiXinOg on 2019/7/24.
//  Copyright © 2019年 beijiXinOg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong, nullable) UIView *view1;
@property (nonatomic, strong, nullable) UIView *view2;
@property (nonatomic, strong, nullable) UIView *view3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    self.view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height-100)];
    self.view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height-200)];
    self.view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height-300)];
    
    [self.view addSubview:self.view1];
    [self.view addSubview:self.view2];
    [self.view addSubview:self.view3];
    
    for (NSInteger i = 0; i < 10; i++) {
        [self.view1 addSubview:[[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)]];
        [self.view2 addSubview:[[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)]];
        [self.view3 addSubview:[[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)]];
    }
    
    NSInteger result = calculateAllSubviewsWithDFS(self.view);
    NSLog(@"%zd", result);
    
    NSInteger result1 = calculateAllSubviewsWithBFS(self.view);
    NSLog(@"%zd", result1);
}

NSInteger calculateAllSubviewsWithDFS(UIView *view) {
    if (view == nil) { // 视图为空的时候返回0
        return 0;
    } else if (view.subviews.count == 0) { // 视图没有子视图的时候返回1
        return 1;
    } else {
        NSInteger count = 1;
        for (NSInteger i = 0; i < view.subviews.count; i++) {
            count += calculateAllSubviewsWithDFS(view.subviews[i]);
        }
        return count;
    }
}

NSInteger calculateAllSubviewsWithBFS(UIView *view) {
    if (view == nil) { // 视图为空的时候返回0
        return 0;
    } else if (view.subviews.count == 0) { // 视图没有子视图的时候返回1
        return 1;
    } else { // 视图有子视图的时候
        NSInteger count = 1;
        //创建队列
        NSMutableArray *arrayM = [NSMutableArray array];
        //入队列
        [arrayM addObject:view];
        // 当队列不为空的时候
        while (arrayM.count) {
            // 取出队列第一个视图
            UIView *subview = arrayM[0];
            //删除队列第一个视图
            [arrayM removeObject:subview];
            //计算第一个视图的的子视图个数
            count += subview.subviews.count;
            // 遍历第一个视图的d所有子视图，并且入队列
            for (NSInteger i = 0; i < subview.subviews.count; i++) {
                // 入队列
                [arrayM addObject:subview.subviews[i]];
            }
        }
        return count;
    }
}


@end

