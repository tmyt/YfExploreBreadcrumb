//
//  NSObject+TCTweetView.h
//  YfExploreBreadcrumb
//
//  Created by 津守 優 on 2012/10/08.
//  Copyright (c) 2012年 Yutaka Tsumori. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(YfExploreBreadcrumb)

- (void)swipeWithEventExtension:(NSEvent *)event;
- (void)scrollWheelExtension:(NSEvent *)event;

@end
