//
//  PolarExampleViewController.m
//  polar-ios-sdk-example
//
//  Created by Jeff on 2/12/14.
//  Copyright (c) 2014 Jeff. All rights reserved.
//

#import "PolarExampleViewController.h"
#import "Polar.h"

@interface PolarExampleViewController ()

@end

@implementation PolarExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    [self loadPolarPolls];
}

- (void)loadPolarPolls
{
    // replace this with the username for your Polar account
    NSString *polarUserName = @"jcole";
    
    // instantiate polar instance and add to view
    Polar *polar = [[Polar alloc] init:polarUserName];
    [self.view addSubview:[polar pollView]];
    
    // set the frame for your embed: 300x300 minimum recommended
    [[polar pollView] setFrame:CGRectMake(0, 30, 320, 320)];
    
    // load your polls
    [polar loadPollSet:@926]; // example of a poll set
    // [polar loadPoll:@98779]; // example of a single poll
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
