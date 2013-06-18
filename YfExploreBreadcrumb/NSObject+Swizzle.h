//
//  NSObject+Swizzle.h
//  YfExploreBreadcrumb
//
//  Created by 津守 優 on 2012/10/08.
//  Copyright (c) 2012年 Yutaka Tsumori. All rights reserved.
//

@interface NSObject(Swizzle)

+ (void)swizzleMethod:(SEL)orig_sel withMethod:(SEL)alt_sel;
+ (void)addMethod:(SEL)sel;

@end