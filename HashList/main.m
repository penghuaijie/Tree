//
//  main.m
//  HashList
//
//  Created by beijiXinOg on 2019/7/16.
//  Copyright © 2019年 beijiXinOg. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL isVaildAgment(char *s, char *t) {
    int lengthS = strlen(s);
    int lengthT = strlen(t);
    
    int a[26] = {0};
    int b[26] = {0};
    
    for (NSInteger i = 0; i < lengthS; i++) {
        int index = s[i]-'a';
        a[index] = 1;
    }
    for (NSInteger i = 0; i < lengthT; i++) {
        int index = t[i]-'a';
        b[index] = 1;
    }
    for (NSInteger i = 0; i < 26; i++) {
        if (a[i] != b[i]) {
            return false;
        }
    }
    return true;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char *s = "acf";
        char *t = "fca";
        BOOL flag = isVaildAgment(s, t);
        NSLog(@"%d", flag);
    }
    return 0;
}
