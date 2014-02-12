## iOS SDK

The iOS SDK is a drop-in Objective-C class that you can use in your iOS project.  

Simply drop these classes into your iOS project:
[Polar iOS SDK classes](polar-ios-sdk-example/polar-ios-sdk-example/polar-ios-sdk)

Example:

```Objective-C
// replace this with the username for your Polar account
NSString *polarUserName = @"jcole";

// instantiate polar instance and add to view
Polar *polar = [[Polar alloc] init:polarUserName];
[self.view addSubview:polar.pollView];

// set the frame for your embed: 300x300 minimum recommended
[polar.pollView setFrame:CGRectMake(0, 30, 320, 320)];

// load your poll set
[polar loadPollSet:@926];
```

[Example of iOS SDK integration](polar-ios-sdk-example)

