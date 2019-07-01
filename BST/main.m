//
//  main.m
//  BST
//
//  Created by beijiXinOg on 2019/7/1.
//  Copyright © 2019年 beijiXinOg. All rights reserved.
//

#import <Foundation/Foundation.h>


// binary search tree

// 满足条件： 左节点 < 根节点 < 右节点
typedef struct TreeNode {
    int data;
    struct TreeNode *left;
    struct TreeNode *right;
} TreeNode;


typedef struct tree {
    struct TreeNode *root;
} Tree;

/**
 *          1
 *        /   \
 *       2     3
 *      /\    /
 *     4  5  6
 */

// 前序遍历 根->左->右
void preorderTraverse(TreeNode *tree) {
    if(tree == NULL) {return;}
    NSLog(@"%d ", tree->data);
    preorderTraverse(tree->left);
    preorderTraverse(tree->right);
}

//中序遍历 左->根->右
void midTraverse(TreeNode *tree) {
    if(tree == NULL) {return;}
    midTraverse(tree->left);
    NSLog(@"%d ", tree->data);
    midTraverse(tree->right);
}

//后序遍历 左->右->根
void postorderTraversal(TreeNode *tree) {
    if(tree == NULL) {return;}
    postorderTraversal(tree->left);
    postorderTraversal(tree->right);
    NSLog(@"%d ", tree->data);
}

void insertNode (Tree *tree, int value) {
    TreeNode *node1 = malloc(sizeof(TreeNode));
    node1->data = value;
    node1->left = NULL;
    node1->right = NULL;
    
    if(tree->root == NULL){
        tree->root = node1;
    } else {
        TreeNode *temp = tree->root;
        while (temp != NULL) {
            if(value < temp->data){
                if(temp->left == NULL) {
                    temp->left = node1;
                    return ;
                } else {
                   temp = temp->left;
                }
                
            } else {
                if(temp->right == NULL) {
                    temp->right = node1;
                    return;
                } else {
                   temp = temp->right;
                }
            }
        }
    }
}


int getBSTHeight (TreeNode *node) {
    if (node == NULL) {
        return 0;
    } else {
        int leftH = getBSTHeight(node->left);
        int rightH = getBSTHeight(node->right);
        int max = leftH;
        if (max < rightH) {
            max = rightH;
        }
        return max+1;
    }
}

int getMaxNum(TreeNode *node) {
    if (node == NULL) {
        return -1;
    } else {
        int leftMax = getMaxNum(node->left);
        int rightMax = getMaxNum(node->right);
        int current = node->data;
        int max = leftMax;
        if (rightMax > max) {
            max = rightMax;
        }
        if (current>max) {
            max = current;
        }
        return max;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int arr[] = {6,3,8,2,5,1,7};
        
        // 创建树
        Tree *tree = malloc(sizeof(Tree));
        tree->root = NULL;
        for(int i=0; i<7; i++) {
            // 树中插入节点
            insertNode(tree, arr[i]);
        }
    
        // 计算树的高度
        int treeH = getBSTHeight(tree->root);
        NSLog(@"树的高度：%d\n", treeH);
        
         // 计算树的最大值
        int maxNum = getMaxNum(tree->root);
        NSLog(@"树的最大值：%d\n", maxNum);
        
        NSLog(@"前序遍历");
        preorderTraverse(tree->root);
        NSLog(@"中序遍历");
        midTraverse(tree->root);
        NSLog(@"后序遍历");
        postorderTraversal(tree->root);
    }
    return 0;
}
