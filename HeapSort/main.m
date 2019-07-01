//
//  main.m
//  HeapSort
//
//  Created by beijiXinOg on 2019/7/1.
//  Copyright © 2019年 beijiXinOg. All rights reserved.
//

#import <Foundation/Foundation.h>

void swap(int *tree, int max, int i) {
    int temp = tree[i];
    tree[i] = tree[max];
    tree[max] = temp;
}

/**
 对一个二叉树进行heapifyd操作

 @param tree 表示二叉树的数组
 @param n 二叉树的节点个数
 @param i 表示要对哪个节点进行heapify操作
 */
void heapify(int *tree, int n, int i) {
    if (i >= n) { // 递归函数出口
        return;
    }
    // 找到i节点的两个子节点
    int c1 = i*2 + 1;
    int c2 = i*2 + 2;
    // 找个三个节点的最大值 假设i是最大值
    int max = i;
    if(c1 < n && tree[c1] > tree[max]) { // c1 < n 表示节点下面没有子节点
        max = c1;
    }
    if (c2 < n && tree[c2] > tree[max]) {
        max = c2;
    }
    if (max != i) { // max != i b如果i已经是最大值了就不用交换了
        swap(tree, max, i);
        heapify(tree, n, max);//max节点继续heapify
    }
}

void buildHeap(int *tree, int n) {
    int lastNode = n-1;
    int parent = (lastNode-1)/2;
    for (int i = parent; i>=0; i--) {
        heapify(tree, n, i);
    }
}

void heapSort (int *tree, int n) {
    buildHeap(tree, n);
    for (int i = n-1; i>=0; i--) {
        swap(tree, i, 0);// 交换更节点和末位节点
        heapify(tree, i, 0); //破坏堆结构后做heapify操作
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int tree[] = {2,5,3,1,10,4};
        int m = 6;
        heapSort(tree, m);
        for (int i = 0; i < m; i++) {
            printf("%d\n", tree[i]);
        }
    }
    return 0;
}

//        int tree[] = {4,10,3,5,1,2};
//        int n = 6;
//        heapify(tree, n, 0);
//
//        for (int i = 0; i < n; i++) {
//            printf("%d\n", tree[i]);
//        }
