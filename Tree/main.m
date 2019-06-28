//
//  main.m
//  Tree
//
//  Created by beijiXinOg on 2019/6/27.
//  Copyright © 2019年 beijiXinOg. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef struct TreeNode {
    int data;
    struct TreeNode *leftChild;
    struct TreeNode *RightChild;
} TreeNode;

/**
 *          1
 *        /   \
 *       2     3
 *      /\    /
 *     4  5  6
 */

// 前序遍历 根->左->右
void preorderTraverse(TreeNode *tree, NSMutableArray *arrayM) {
    if(tree == NULL) {return;}
    [arrayM addObject:@(tree->data)];// 记录节点
    preorderTraverse(tree->leftChild, arrayM);
    preorderTraverse(tree->RightChild, arrayM);
}

//中序遍历 左->根->右
void midTraverse(TreeNode *tree, NSMutableArray *arrayM) {
    if(tree == NULL) {return;}
    midTraverse(tree->leftChild, arrayM);
    [arrayM addObject:@(tree->data)];// 记录节点
    midTraverse(tree->RightChild, arrayM);
}

//后序遍历 左->右->根
void postorderTraversal(TreeNode *tree, NSMutableArray *arrayM) {
    if(tree == NULL) {return;}
    postorderTraversal(tree->leftChild, arrayM);
    postorderTraversal(tree->RightChild, arrayM);
    [arrayM addObject:@(tree->data)];// 记录节点
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        TreeNode *root = malloc(sizeof(TreeNode));
        root->data = 1;
        
        TreeNode *node1 = malloc(sizeof(TreeNode));
        node1->data = 2;
        
        TreeNode *node2 = malloc(sizeof(TreeNode));
        node2->data = 3;
        
        TreeNode *node3 = malloc(sizeof(TreeNode));
        node3->data = 4;
        node3->leftChild = NULL;
        node3->RightChild = NULL;
        
        TreeNode *node4 = malloc(sizeof(TreeNode));
        node4->data = 5;
        node4->leftChild = NULL;
        node4->RightChild = NULL;
        
        TreeNode *node5 = malloc(sizeof(TreeNode));
        node5->data = 6;
        node5->leftChild = NULL;
        node5->RightChild = NULL;
        
        root->leftChild = node1;
        root->RightChild = node2;
        
        node1->leftChild = node3;
        node1->RightChild = node4;
        
        node2->leftChild = node5;
        node2->RightChild= NULL;
        
        NSMutableArray *arrayM = [NSMutableArray array];
        preorderTraverse(root, arrayM);
        NSLog(@"%@",arrayM);// 124536
        
        NSMutableArray *arrayM1 = [NSMutableArray array];
        midTraverse(root, arrayM1);
        NSLog(@"%@",arrayM1);//425163
        
        NSMutableArray *arrayM2 = [NSMutableArray array];
        postorderTraversal(root, arrayM2);
        NSLog(@"%@",arrayM2);// 452631
    }
    return 0;
}
