//
//  NSObject+Swizzle.m
//  YfExploreBreadcrumb
//
//  Created by 津守 優 on 2012/10/08.
//  Copyright (c) 2012年 Yutaka Tsumori. All rights reserved.
//

#import "NSObject+Swizzle.h"
#import <objc/objc-class.h>

@implementation NSObject(Swizzle)

+ (void)swizzleMethod:(SEL)orig_sel withMethod:(SEL)alt_sel
{
    Method orig_method = class_getInstanceMethod(self, orig_sel);
    Method alt_method = class_getInstanceMethod(self, alt_sel);
    
    NSLog(@"orig_method: %d", orig_method == nil);
    NSLog(@"alt_method: %d", alt_method == nil);
    
    if (orig_method == nil || alt_method == nil) {
        NSLog(@"method not exists.");
        return;
    }
    
    class_addMethod(self,
                    orig_sel,
                    class_getMethodImplementation(self, orig_sel),
                    method_getTypeEncoding(orig_method));
    
    class_addMethod(self,
                    alt_sel,
                    class_getMethodImplementation(self, alt_sel),
                    method_getTypeEncoding(alt_method));
    
    method_exchangeImplementations(class_getInstanceMethod(self, orig_sel), class_getInstanceMethod(self, alt_sel));
}

+ (void)addMethod:(SEL)sel
{
    class_addMethod(self,
                    sel,
                    class_getMethodImplementation(self, sel),
                    method_getTypeEncoding(class_getInstanceMethod(self, sel)));
    
}

@end