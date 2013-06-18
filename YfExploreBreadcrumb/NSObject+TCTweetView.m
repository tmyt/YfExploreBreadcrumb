//
//  NSObject+TCTweetView.m
//  YfExploreBreadcrumb
//
//  Created by 津守 優 on 2012/10/08.
//  Copyright (c) 2012年 Yutaka Tsumori. All rights reserved.
//

#import "NSObject+TCTweetView.h"

#import "YfExploreBreadcrumb.h"

#import "TCTweetView.h"
#import "TCTweetStorage.h"
#import "TCTweetDataSource.h"

#import <objc/objc-class.h>

@implementation NSObject(YfExploreBreadcrumb)

- (void)swipeWithEventExtension:(NSEvent *)event
{
    if ([event type] == NSEventTypeSwipe) {  // ※これは不要かもしれない
        // スワイプされた時の処理
        NSLog(@"Swipe detected");
    }
}


- (void)scrollWheelExtension:(NSEvent *)event
{
    // ジェスチャーのスクロールかどうか
    if ([event phase] == NSEventPhaseNone) {
        [self scrollWheelExtension:event];
        return;
    }
    // 横スクロールかどうか
    if (fabsf([event scrollingDeltaX]) <= fabsf([event scrollingDeltaY]))  {
        [self scrollWheelExtension:event];
        return;
    }
    // システム環境設定でスクロールのジェスチャーが有効かどうか
    if (![NSEvent isSwipeTrackingFromScrollEventsEnabled])  {
        [self scrollWheelExtension:event];
        return;
    }
    
    // 左右にあるページの数(0にすると、その方向にはいけなくなる)
    CGFloat numPagesToLeft = -1.0; // 左にあるページの数
    CGFloat numPagesToRight = 1.0; // 右にあるページの数
    
    NSLog(@"scrollWheel");
    
    // アニメーション用のViewを用意
    //CGFloat width = self.bounds.size.width;
    //CGFloat height = self.bounds.size.height;
    //NSView *animationView = [[[NSView alloc]
    //                          initWithFrame:NSMakeRect(-width, 0, width * 3, height)] autorelease];
    
    [event trackSwipeEventWithOptions:NSEventSwipeTrackingClampGestureAmount
             dampenAmountThresholdMin:numPagesToLeft max:numPagesToRight
                         usingHandler:^(CGFloat gestureAmount, NSEventPhase phase,
                                        BOOL isComplete, BOOL *stop) {
                             // はじめ
                             if (phase == NSEventPhaseBegan) {
                                 
                             }
                             
                             // gestureAmount に合わせて動かす
                             
                             
                             // 指を離したときやキャンセルになったとき
                             if (phase == NSEventPhaseEnded) {
                             } else if (phase == NSEventPhaseCancelled) {
                             }
                             
                             // 最後、終了処理
                             if (isComplete) {
                                 // ページを切り替える処理などを
                                 if (gestureAmount <= -0.5) {
                                     NSLog(@"push breadcrumb");
                                     TCTweetStorage* tweetStorage;
                                     object_getInstanceVariable(self, "tweetStorage", (void**)&tweetStorage);
                                     [[tweetStorage dataSource] pushConversationView: [((TCTweetView*)self) selectedCell]];
                                     *stop = true;
                                 } else if (gestureAmount == 0) {
                                 } else if (gestureAmount >= 0.5) {
                                     NSLog(@"pickup breadcrumb");
                                     TCTweetStorage* tweetStorage;
                                     object_getInstanceVariable(self, "tweetStorage", (void**)&tweetStorage);
                                     [[tweetStorage dataSource] popView];
                                     *stop = true;
                                 }
                             }
                         }];
    
}

@end
