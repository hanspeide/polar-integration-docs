## Polar iOS SDK

![Example of Polar iOS SDK integration](https://polar-api-docs-assets.s3.amazonaws.com/example-polar-ios-sdk.png)

The iOS SDK consists of a Cocoa Touch class that you can use in your iOS project.

The primary class is `Polar`.  You instantiate an instance of Polar with your Polar website username.  The instance of `Polar` then creates a UIWebView that will contain the embedded polls.  You can get access to the UIWebview via the `pollView` attribute.  Add this UIWebView to your app in any way you would normally use a UIWebView.  

Note that the minimum recommended size for the `pollView` UIWebView is 300x300.

Example code:

```Objective-C
// replace this with the username for your Polar account
NSString *polarUserName = @"jcole";

// instantiate polar instance and add to view
Polar *polar = [[Polar alloc] init:polarUserName environment:PolarEnvironmentProduction];
[self.view addSubview:polar.pollsView];

// set the frame for your embed: 300x300 minimum recommended
[polar.pollsView setFrame:CGRectMake(0, 30, 320, 320)];

// load your polls
[polar loadPollSet:@926]; // example of a poll set
// [polar loadPoll:@98779]; // example of a single poll
```

Here is an an example project, showing it in action: <br />
[Example project](polar-ios-sdk-example)

The class files: <br />
[Polar.h](polar-ios-sdk-example/polar-ios-sdk-example/polar-ios-sdk/Polar.h) <br />
[Polar.m](polar-ios-sdk-example/polar-ios-sdk-example/polar-ios-sdk/Polar.m)

---

### Polar Class API

**Version 1.0**

#### Init

```Objective-C
- (id)init:(NSString *)username environment:(PolarEnvironment)polarEnvironment;
```

Param | Description
-----|------
username | User's Polar username or email.  Case sensitive.
polarEnvironment | Whether to use the production environment (`PolarEnvironmentProduction`) or test environment `PolarEnvironmentTest`.

#### Get the configured username

```Objective-C
- (NSString *)username;
```

#### Get the UIWebView containing the embedded polls

```Objective-C
- (UIWebView *)pollsView;
```

#### Load and display a single poll

```Objective-C
- (void)loadPoll:(NSNumber*)pollID;
```

Param | Description
-----|------
pollID | The ID of the poll to load.

#### Load and display a poll set

```Objective-C
- (void)loadPollSet:(NSNumber*)pollSetID;
```

Param | Description
-----|------
pollSetID | The ID of the poll set to load.
