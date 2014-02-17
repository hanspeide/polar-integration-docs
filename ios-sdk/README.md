## iOS SDK

![Example of Polar iOS SDK integration](https://polar-production-web-assets.s3.amazonaws.com/api-docs/example-polar-ios-sdk.png)

The iOS SDK consists of a Cocoa Touch class that you can use in your iOS project.

The primary class is `Polar`.  You instantiate an instance of Polar with your Polar website username.  The instance of `Polar` then creates a UIWebView that will contain the embedded polls.  You can get access to the UIWebview via the `pollView` attribute.  Add this UIWebView to your app in any way you would normally use a UIWebView.  

Note that the minimum recommended size for the `pollView` UIWebView is 300x300.

Example code:

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

Here is an an example project, showing it in action: <br />
[Example project](polar-ios-sdk-example)

The class files: <br />
[Polar.h](polar-ios-sdk-example/polar-ios-sdk-example/polar-ios-sdk/Polar.h) <br />
[Polar.m](polar-ios-sdk-example/polar-ios-sdk-example/polar-ios-sdk/Polar.m)

---

### Polar Class API

#### Init

```Objective-C
- (id)init:(NSString *)username;
```

Param | Description
-----|------
username | User's Polar username or email.  Case sensitive.

#### Get the configured username

```Objective-C
- (NSString *)username;
```

#### Get the UIWebView containing the embedded polls

```Objective-C
- (UIWebView *)pollView;
```

#### Loads and displays a poll set

```Objective-C
- (void)loadPollSet:(NSNumber*)pollSetID;
```

Param | Description
-----|------
pollSetID | The ID of the poll set to load.
