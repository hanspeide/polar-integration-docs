## Embedding Polls via tag

Our `<script>` tag loads a light-weight (~30kb), self-rendering javascript component wrapped in an iFrame.  This component is based on industry standard third-party JS best practices to ensure safe usage in your site.  The loaded polls will [responsively size themselves](http://polarb.com/publishers/poll_sets/926/preview) to look good in your page.

Example:

```HTML
<script src="http://assets-polarb-com.a.ssl.fastly.net/assets/polar-embedded.js" 
 async="true" 
 data-publisher="jcole" 
 data-poll-set="926"></script>
```

Here you would fill in the attribute **data-publisher** with your own publisher name, and **data-poll-set** with the ID for your poll set.  
  
See the included [test\_script\_embed.html](/test_script_embed.html) web page in this repository for a working eample.

###iframe

Some hosting providers may not let you embed a script page into your content (for example, Wordpress.com).  In this case, use the following `<iframe>` instead.  It will load the same content as the script tag.  The drawback here is that you need to specify a fixed size for the iframe container: we can't responsively resize this iframe based on your clients' screen sizes.

Example:

```HTML
<iframe seamless="seamless" style="border: none;" 
  height="450" width="100%" 
  scrolling="no" style="overflow: hidden;"
  src="http://assets-polarb-com.a.ssl.fastly.net/api/v4/publishers/jcole/embedded_polls/iframe?pollset_id=926"></iframe>
```

Here you would replace the attribute **jcole** with your own publisher name, and the **pollset_id** query param (926) with the ID for your poll set.  

See the included [test\_iframe\_embed.html](/test_iframe_embed.html) web page in this repository for a working eample.

###Embedding into native apps (e.g. iOS/Android) 

The approach for native apps is largely the same as integrating into your website above.  The only differences are:

* you will need to create a UIWebView (iOS) or WebView (Android) to contain the polls
* you should directly load the [web page for the poll set](http://assets-polarb-com.a.ssl.fastly.net/api/v4/publishers/jcole/embedded_polls/iframe?pollset_id=926) that contains poll component (instead of inserting the script tag mentioned above)

iOS example:

```Objective-C
NSString *fullURL = @"http://assets-polarb-com.a.ssl.fastly.net/api/v4/publishers/jcole/embedded_polls/iframe?pollset_id=926";
NSURL *url = [NSURL URLWithString:fullURL];
NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
[self.webView loadRequest:requestObj];
```

Here you would replace the attribute **jcole** with your own publisher name, and the **pollset_id** query param (926) with the ID for your poll set.  

See the included [example-ios-integration](/example-ios-integration) XCode project in this repository for a working eample.

### Getting started

1. [Signup for a Polar account](http://polarb.com/join)

2. [Make some great looking Polls and Poll Sets](http://www.polarb.com/howtos)

3. After creating a poll or pollset, on the "Publish" tab, grab the relevant embed code (either iFrame or script tag) for your poll set and account.  Or, grab the Poll Set ID so you can set the URL for WebView integration with native apps.

### Technical details about the Javascript component

Polar Embedded Polls is easy to use, safe, and fast. Include an async `<script>` tag on your page where the polls should render and customize settings with HTML5 data tags.  Polar Embedded will load asynchronously and reliably over our Fastly CDN after your content and render itself in an iFrame.  Only one, optimized AJAX request is made to pull the latest poll data for your reader.  Javascript execution is wrapped in an anonymous closure and wrapped in error handling to prevent interfering with your page.  Styling Polar Embedded provides the best of both worlds - an isolated iFrame container for HTML/CSS, but interfaces to apply custom CSS. Polar Embedde is cross-browser safe supporting IE/Firefox/Safari and major mobile browsers using progressively enhanced Javascript and responsive HTML/CSS design.

The main Polar Embedded Javascript library is concatenated, minified, and gzipped before being deployed on a global Fastly CDN (powering Twitter, The Guardian, Github, etc).  The Javascript application includes all of its own depdencies, executes within an anonymous closure, and does not pollute/collide with the global window namespace.  A single AJAX request to Polar APIs initializes the polls to be shown and publisher configuration. Readers voting on polls trigger AJAX API requests to track votes in the Polar backend.

Where the `<script>` tag is placed on the page, an iFrame is added to the page DOM.  Polar Embedded then renders its HTML/CSS into this iFrame locally without network requests.  Behavior within Polar Embedded is implemented using an embedded jQuery in compatibility mode isolated from the parent page.  Additional embedding formats like a isolated `<iFrame>` tag, `oEmbed`, or `Embed.ly` are also available.

Mobile webviews in iOS/Android can target the iFrame API which serves up a minimal page displaying an embedded poll anywhere within an existing mobile app.

Responsive design and custom publisher CSS allow Polar to flow with your layout at any screen size.  CSS may be applied to the Polar Embedded container to position/size the polls on your page.  Internal CSS can be applied to the Polar Embedded iFrame to use custom fonts, colors, look, and feel of the application to match your site.  Polar Polls can handle screens or web cards as small as 300px wide, but scale up to full size desktop layouts for articles.
