/*
 *     Generated by class-dump 3.3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2011 by Steve Nygard.
 */


@class NSSet, NSString, NSTabView, TCTabBarControl, TCTabManager, TCTweet, TCTweetClipView, TCTweetDataSource, TCTweetView;

@interface TCTweetStorage : NSObject
{
    NSTabView *tabView;
    TCTabBarControl *tabController;
    TCTweetView *tweetView;
    TCTabManager *tabManager;
    TCTweetDataSource *dataSource;
    BOOL doNotMarkAsRead;
    TCTweetClipView *tweetViewClipping;
    NSString *focusedUserCache;
    BOOL enableHyper;
    NSSet *basicReplyChainUsers;
    long long currentReplyChainId;
    TCTweet *currentSelection;
    TCTweet *markedTweet;
    long long scrollMarkRow;
    BOOL ignoreScrollOption;
    double currentScrollOffset;
}

@property(nonatomic) BOOL enableHyper; // @synthesize enableHyper;
@property(readonly) NSString *focusedUserCache; // @synthesize focusedUserCache;
@property(nonatomic) BOOL doNotMarkAsRead; // @synthesize doNotMarkAsRead;
@property(retain, nonatomic) TCTweetDataSource *dataSource; // @synthesize dataSource;
@property(retain, nonatomic) TCTabManager *tabManager; // @synthesize tabManager;
@property(retain, nonatomic) TCTweetView *tweetView; // @synthesize tweetView;
@property(retain, nonatomic) TCTabBarControl *tabController; // @synthesize tabController;
@property(retain, nonatomic) NSTabView *tabView; // @synthesize tabView;
- (void)updateOneWayFollowing:(id)arg1;
- (BOOL)setReadFlag:(id)arg1 updateCount:(BOOL)arg2 forceSet:(BOOL)arg3;
- (void)clearTimelineLogs:(id)arg1;
- (void)clearMentionsLogs:(id)arg1;
- (void)clearDMLogs:(id)arg1;
- (void)clearLogs:(id)arg1;
- (void)tweetsHaveBeenAdded:(id)arg1;
- (void)tweetsWillBeAdded:(id)arg1;
- (void)tweetsHaveBeenRemoved:(id)arg1;
- (void)tweetsWillBeRemoved:(id)arg1;
- (void)updateReplyChainFromNotification:(id)arg1;
- (void)updateReplyChain:(BOOL)arg1;
- (void)startReplyChain:(id)arg1;
- (void)updateDMConversation:(id)arg1;
- (void)setBasicReplyChainUsersForTweet:(id)arg1;
- (id)followReplyChain:(long long)arg1;
- (void)fillReplyTreeForTweet:(id)arg1;
- (void)updateBlockingRule;
- (void)tweetViewScrolled:(id)arg1;
- (void)markAllAsRead:(id)arg1;
- (BOOL)isInSingleUserView:(id)arg1;
- (void)setFocusedUser:(id)arg1;
- (void)clearFocusedUser;
- (void)updateSingleUserView;
- (void)setTweetViewClipping:(id)arg1;
- (void)awakeFromNib;

@end
