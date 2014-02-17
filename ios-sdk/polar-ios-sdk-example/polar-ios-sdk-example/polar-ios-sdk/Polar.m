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

@property (nonatomic, strong) NSString *polarUsername;
@property (nonatomic, strong) UIWebView *pollsWebView;

@end

@implementation Polar

- (id)init:(NSString *)username
{
    self = [super init];
    if (self) {
        // Initialize self.
        self.pollsWebView = [[UIWebView alloc] init];
    }
    return self;
}

- (NSString *)username
{
    return self.polarUsername;
}

- (void)loadPollSet:(NSNumber*)pollSetID
{
    NSString *fullURL = [NSString stringWithFormat:@"http://assets-polarb-com.a.ssl.fastly.net/api/v4/publishers/%@/embedded_polls/iframe?pollset_id=%@", self.polarUsername, pollSetID];
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.pollsWebView loadRequest:requestObj];
}

- (UIWebView *)pollView
{
    return self.pollsWebView;
}

@end
