//
//  main.m
//  Dynamic
//
//  Created by beijiXinOg on 2019/7/10.
//  Copyright © 2019年 beijiXinOg. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 n个台阶 一次只能走 一步l或者两步，问有多少步解法
 当 n=0，即没有台阶时 走法为0
 当 n=1，台阶为1时 走法为1
 当 n=2，台阶为2时 走法为：一步一步 ， 两步
 
 当为n个时, 相当于在n-1这个台阶走一步或者在n-2这个台阶走两步
 所以n个台阶 相当于 n-1个台阶的走法加上n-2个台阶的走法
 
 递归实现：
 递归函数： dp(n) = dp(n-1) + dp(n-2)
 递归出口： n=0 return 0、n=1 return 1、n=2 return 2
 @param n 个台阶
 @return n个台阶走法
 */
int dp(int n) {
    if (n == 0) {
        return 0;
    } else if (n == 1) {
        return 1;
    } else if (n == 2) {
        return 2;
    }  else {
        return dp(n-1) + dp(n-2);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int sum;
        sum = dp(2);
        NSLog(@"2个台阶的走法：%d\n", sum);
        
        sum = dp(3);
        NSLog(@"3个台阶的走法：%d\n", sum);
        
        sum = dp(4);
        NSLog(@"4个台阶的走法：%d\n", sum);
        
        sum = dp(9);
        NSLog(@"9个台阶的走法：%d\n", sum);
    }
    return 0;
}
