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

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) UIWebView *pollsView;
@property (nonatomic, assign) PolarEnvironment environment;
@end

@implementation Polar

// Public methods

- (id)init:(NSString *)username environment:(PolarEnvironment)environment
{
    self = [super init];
    if (self) {
        // Initialize self.
        _environment = environment;
        _username = username;
        _pollsView = [[UIWebView alloc] init];
    }
    return self;
}

- (NSString *)username
{
    return _username;
}

- (UIWebView *)pollsView
{
    return _pollsView;
}

- (void)loadPoll:(NSNumber*)pollID
{
    NSString *fullURL = [NSString stringWithFormat:@"%@/publishers/%@/embedded_polls/iframe?poll_id=%@", [self baseURLforEnvironment], self.username, pollID];
    [self loadPollsWithURL:fullURL];
}

- (void)loadPollSet:(NSNumber*)pollSetID
{
    NSString *fullURL = [NSString stringWithFormat:@"%@/publishers/%@/embedded_polls/iframe?pollset_id=%@", [self baseURLforEnvironment], self.username, pollSetID];
    [self loadPollsWithURL:fullURL];
}

// Private methods

- (void)loadPollsWithURL:(NSString *)urlString
{
    NSLog(@"loading polls for: %@", urlString);
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.pollsView loadRequest:requestObj];
}

- (NSString *)baseURLforEnvironment
{
    if (self.environment == PolarEnvironmentTest) {
        return @"http://polar-rails-staging.herokuapp.com/api/v4";
    } else if (self.environment == PolarEnvironmentProduction) {
        return @"http://assets-polarb-com.a.ssl.fastly.net/api/v4";
    } else {
        return nil;
    }
}

@end
