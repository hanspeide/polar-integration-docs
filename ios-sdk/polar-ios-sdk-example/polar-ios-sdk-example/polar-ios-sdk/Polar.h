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

// initialize with the username for your Polar account
- (id)init:(NSString *)username;

// the currently configured username
- (NSString *)username;

// the UIWebView containing the polls
- (UIWebView *)pollView;

// load a poll set with specified ID
- (void)loadPollSet:(NSNumber*)pollSetID;

@end
