//
//  Polar.h
//
//  Polar iOS SDK, version 1.0
//
//  support@polarb.com
//
//  Created by Input Factory on 2/12/14.
//  Copyright (c) 2014 Input Factory. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Polar : NSObject

typedef enum {
    PolarEnvironmentTest,
    PolarEnvironmentProduction
} PolarEnvironment;

// initialize with the username for your Polar account
- (id)init:(NSString *)username environment:(PolarEnvironment)polarEnvironment;

// the currently configured username
- (NSString *)username;

// the UIWebView containing the polls
- (UIWebView *)pollsView;

// load a single poll with the specified ID
- (void)loadPoll:(NSNumber*)pollID;

// load a poll set with specified ID
- (void)loadPollSet:(NSNumber*)pollSetID;

@end
