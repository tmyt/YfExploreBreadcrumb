//
//  YfExploreBreadcrumb.m
//  YfExploreBreadcrumb
//
//  Created by 津守 優 on 2012/10/08.
//  Copyright (c) 2012年 Yutaka Tsumori. All rights reserved.
//

#import "YfExploreBreadcrumb.h"

#import <objc/objc-class.h>

#import "NSObject+Swizzle.h"

@implementation YfExploreBreadcrumb

+ (void)load
{
    NSLog(@"YfExploreBreadcrumb loaded");
    
    NSLog(@"Load TCTweetView Class");
    Class class = objc_getClass("TCTweetView");
    
    NSLog(@"TCTweetView: %d", (int)[class version]);
    
    NSLog(@"Swizzle...");
   // [TCTweetViewClass swizzleMethod:@selector(swipeWithEvent) withMethod:@selector(replacedSwipeWithEvent)];
    
    [class swizzleMethod:@selector(swipeWithEvent:) withMethod:@selector(swipeWithEventExtention:)];
    [class swizzleMethod:@selector(scrollWheel:) withMethod:@selector(scrollWheelExtension:)];
}

@end
