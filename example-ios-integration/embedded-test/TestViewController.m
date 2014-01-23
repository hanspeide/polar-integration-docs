//
//  TestViewController.m
//  embedded-test
//
//  Created by Jeff on 1/22/14.
//  Copyright (c) 2014 Jeff. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self displayEmbeds];
}

- (void)displayEmbeds
{
    NSString *fullURL = @"http://assets-polarb-com.a.ssl.fastly.net/api/v4/publishers/jcole/embedded_polls/iframe?pollset_id=926";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
