//
//  Polar.m
//
//  Polar iOS SDK, version 1.0
//
//  support@polarb.com
//
//  Created by Input Factory on 2/12/14.
//  Copyright (c) 2014 Input Factory. All rights reserved.
//

#import "Polar.h"

@interface Polar()

@end

@implementation Polar

- (id)init:(NSString *)username
{
    self = [super init];
    if (self) {
        // Initialize self.
        self.pollView = [[UIWebView alloc] init];
    }
    return self;
}

- (void)loadPollSet:(NSNumber*)pollSetID
{
    NSString *fullURL = [NSString stringWithFormat:@"http://assets-polarb-com.a.ssl.fastly.net/api/v4/publishers/%@/embedded_polls/iframe?pollset_id=%@", self.accountUserName, pollSetID];
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.pollView loadRequest:requestObj];
}

@end
