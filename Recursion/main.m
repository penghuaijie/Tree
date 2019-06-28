//
//  main.m
//  Recursion
//
//  Created by beijiXinOg on 2019/6/28.
//  Copyright © 2019年 beijiXinOg. All rights reserved.
//

#import <Foundation/Foundation.h>

// 递归两个必要条件：1.递归函数 2.递归出口

/**
 假设有个数列 1 3 5 7 9 11 ....

 递归函数：f(n) = f(n-1)+2;
 递归出口: f(1) = 1;
 
 @param n 求n项的值
 @return 返回第n项的值
 */
int find(int n) {
    if (n == 1) {// 递归出口
        return 1;
    } else {//递归函数
        return find(n-1)+2;
    }
}

/**
 fibonacci 斐波那契数列
 1 1 2 3 5 8 13 21 ....
 
递归函数:fibonacci(n) = fibonacci(n-1)+fibonacci(n-2)
递归出口:fibonacci(1) = 1,fibonacci(2) = 1;
 
 @param n 求第n项
 @return 返回第n项的值
 */
int fibonacci (int n) {
    if (n==1 || n==2) { // 递归出口
        return 1;
    } else { //递归函数
        return fibonacci(n-1)+fibonacci(n-2);
    }
    return 0;
}

/**
 //有序数列
 求和：1+2+3+4+...+100
 
 递归函数:sum(n) = sum(n-1)+n
 递归出口:f(1) = 1

 @param n 前n项
 @return 返回 前n项的和
 */
int sum(int n) {
    if (n == 1) {
        return 1;
    } else {
        return sum(n-1)+n;
    }
}

/**
 //无序数列
 求前n项的和：int arr[] = {1, 7, 8, 6, 8, 9, 0, 10}

 递归函数:sum1(arr,n) = sum1(arr,n-1)+arr[n];
 递归出口:sum1(arr,0) = arr[0]
 
 @param arr 数组
 @param n 求数组中第几项
 @return 返回中前n项的和
 */
int sum1(int arr[], int n) {
    if (n == 0) {
        return arr[0];
    } else {
        return sum1(arr,n-1)+arr[n];
    }
}

/**
 //无序数列
 求数组中前n项的最大值：int arr1[] = {7, 4, 8, 6, 8, 9, 11, 5}
 
 递归函数:      if (findMaxNum(arr, n-1) > arr[n]) {
                    return findMaxNum(arr, n-1);
               } else {
                    return arr[n];
               };
 递归出口:n == 0 return arr[0];

 @param arr 数组
 @param n 求数组中前n项的最大值
 @return 返回数组中前n项的最大值
 */
int findMaxNum(int arr[], int n) {
    if (n == 0) {
        return arr[0];
    } else if (findMaxNum(arr, n-1) > arr[n]) {
        return findMaxNum(arr, n-1);
    } else {
        return arr[n];
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int num ;
        
        num = find(6);
        printf("第6项的值为%d\n",num);
        
        num = fibonacci(6);
        printf("第6项的值为%d\n",num);
        
        num = sum(100);
        printf("前100项的和为%d\n",num);
        
        int arr[] = {1, 7, 8, 6, 8, 9, 0, 10};
        num = sum1(arr,7);
        printf("前7项的和为%d\n",num);
        
        int arr1[] = {7, 4, 8, 6, 8, 9, 11, 5};
        num = findMaxNum(arr1, 7);
        printf("前7项的最大值为%d\n",num);
    }
    return 0;
}
