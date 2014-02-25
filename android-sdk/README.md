## Polar Android SDK

![Example of Polar Android SDK integration](https://polar-api-docs-assets.s3.amazonaws.com/example-polar-android-sdk.png)

*Thanks to [Hans Petter Eide](https://github.com/hanspeide) for the initial work on the Android SDK.*

This project is demonstration of embedding Polar polls via a WebView in Android.

The primary class is `PolarWebViewBuilder`.  You instantiate an instance of PolarWebViewBuilder with your Polar website username and the target environment (Test or Production).  

The instance of `PolarWebViewBuilder` then creates a WebView that will contain the embedded polls.  Add this WebView to your app in any way you would normally use a WebView.  

Note that the minimum recommended size for the WebView is 300x300.

Example code:

```Java
PolarWebView webView = new PolarWebViewBuilder(this, "jcole", PolarEnvironment.PRODUCTION).withPollSetId(926).build();
```

