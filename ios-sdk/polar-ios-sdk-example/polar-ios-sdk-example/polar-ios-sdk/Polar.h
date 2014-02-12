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

@property (nonatomic, strong) NSString *accountUserName;
@property (nonatomic, strong) UIWebView *pollView;

// the username for your Polar account
- (id)init:(NSString *)username;

// the poll set to load
- (void)loadPollSet:(NSNumber*)pollSetID;

@end
