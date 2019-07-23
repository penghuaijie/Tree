//
//  main.m
//  HashChars
//
//  Created by beijiXinOg on 2019/7/22.
//  Copyright © 2019年 beijiXinOg. All rights reserved.
//

#import <Foundation/Foundation.h>

int firstUniqChar(char * s){
    int a[26] = {0};
    int count = strlen(s);
    int index = 0;
    for (int i = 0; i < count; i++) {
        index = s[i] - 'a';
        a[index] ++;
    }
    for (int i = 0; i < count; i++) {
        if (a[s[i] - 'a'] == 1)
            return i;
    }
    return -1;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char *s = "leetcode";
        int index = firstUniqChar(s);
        printf("\n%d", index);
    }
    return 0;
}
