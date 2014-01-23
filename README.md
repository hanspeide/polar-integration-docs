### Executive Summary

![Example Polar embedded poll](http://assets-polarb-com.a.ssl.fastly.net/assets/phablet-embedded-2388c897bfdb5bc6b96133eac1f1353f.png)

[Polar polls](http://polarb.com/polls) can be embedded on any website or native app (e.g. iOS/Android).  They look great on both due to [responsive design](http://polarb.com/publishers/poll_sets/926/preview).

The technology behind Polar Embeddded Polls is a light-weight (~ 30kb), self-rendering javascript component wrapped in an iFrame based on industry standard third-party JS best practices.  

### Embedding Polls

Polls can be embedded into websites or native apps.

**Into websites**

There are two options for inserting into websites:

* As a `<script>` tag within your web page.  This is the preferred approach for websites, as it allows Polar Embedded Polls to most flexibly respond to your layout.  For example:

```HTML
<script src="http://assets-polarb-com.a.ssl.fastly.net/assets/polar-embedded.js" 
 async="true" 
 data-publisher="jcole" 
 data-poll-set="926"></script>
```

Here you would fill in the attribute **data-publisher** with your own publisher name, and **data-poll-set** with the ID for your poll set.  
  
* As an `<iframe>` tag within your web page.  When the `<script>` approach is not feasible (some content hosts do not permit inserting script tags), the iFrame approach will work.

```HTML
<iframe seamless="seamless" style="border: none;" 
  height="450" width="100%" 
  scrolling="no" style="overflow: hidden;"
  src="http://assets-polarb-com.a.ssl.fastly.net/api/v4/publishers/jcole/embedded_polls/iframe?pollset_id=926"></iframe>
```

Here you would replace the attribute **jcole** with your own publisher name, and the **pollset_id** query param (926) with the ID for your poll set.  

**Into native apps (e.g. iOS/Android)**  

The approach for native apps is to create a UIWebView (iOS) or WebView (Android) and load the page with the self-contained poll component:

* iOS example

```Objective-C
NSString *fullURL = @"http://assets-polarb-com.a.ssl.fastly.net/api/v4/publishers/jcole/embedded_polls/iframe?pollset_id=926";
NSURL *url = [NSURL URLWithString:fullURL];
NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
[self.webView loadRequest:requestObj];
```

Here you would replace the attribute **jcole** with your own publisher name, and the **pollset_id** query param (926) with the ID for your poll set.  


### Getting Started

1. [Signup for a Polar account](http://polarb.com/join)

2. [Make some great looking Polls and Poll Sets](http://www.polarb.com/howtos)

3. After creating a poll or pollset, on the "Publish" tab, grab the relevant embed code (either iFrame or script tag) for your poll set and account.  Or, grab the Poll Set ID so you can set the URL for WebView integration with native apps.

### Technical Details

Polar Embedded Polls is easy to use, safe, and fast. Include an async `<script>` tag on your page where the polls should render and customize settings with HTML5 data tags.  Polar Embedded will load asynchronously and reliably over our Fastly CDN after your content and render itself in an iFrame.  Only one, optimized AJAX request is made to pull the latest poll data for your reader.  Javascript execution is wrapped in an anonymous closure and wrapped in error handling to prevent interfering with your page.  Styling Polar Embedded provides the best of both worlds - an isolated iFrame container for HTML/CSS, but interfaces to apply custom CSS. Polar Embedde is cross-browser safe supporting IE/Firefox/Safari and major mobile browsers using progressively enhanced Javascript and responsive HTML/CSS design.

The main Polar Embedded Javascript library is concatenated, minified, and gzipped before being deployed on a global Fastly CDN (powering Twitter, The Guardian, Github, etc).  The Javascript application includes all of its own depdencies, executes within an anonymous closure, and does not pollute/collide with the global window namespace.  A single AJAX request to Polar APIs initializes the polls to be shown and publisher configuration. Readers voting on polls trigger AJAX API requests to track votes in the Polar backend.

Where the `<script>` tag is placed on the page, an iFrame is added to the page DOM.  Polar Embedded then renders its HTML/CSS into this iFrame locally without network requests.  Behavior within Polar Embedded is implemented using an embedded jQuery in compatibility mode isolated from the parent page.  Additional embedding formats like a isolated `<iFrame>` tag, `oEmbed`, or `Embed.ly` are also available.

Mobile webviews in iOS/Android can target the iFrame API which serves up a minimal page displaying an embedded poll anywhere within an existing mobile app.

Responsive design and custom publisher CSS allow Polar to flow with your layout at any screen size.  CSS may be applied to the Polar Embedded container to position/size the polls on your page.  Internal CSS can be applied to the Polar Embedded iFrame to use custom fonts, colors, look, and feel of the application to match your site.  Polar Polls can handle screens or web cards as small as 300px wide, but scale up to full size desktop layouts for articles.

### What about an API?

There is an API to access the data directly.  However, it was written to support the Polar iOS app and polarb.com web-based client; it wasn't necessarily intended for third-party developers.  As such, there's a bit of cruft that has developed over time.  You can feel free to use it, but as it is not an "official" API, it may change at any time.  If your approach is not well-suited to the integration techniques described above, [Contact us](http://polarb.com/contact) for further information about the API.

Here is an example of the API:

**API: get the most recent polls in Polar**
<pre>
Request:
GET https://polarb.com/api/v4/polls

Example response:
[
  {
    "pollID": 153722,
    "url": "http://polarb.com/153722-which-game-are-you-going-to-play-in-2014",
    "shortUrl": "http://polarb.com/153722",
    "caption": "Which Game Are You Going To Play In 2014?",
    "created": "2014-01-20T12:46:53Z",
    "public": true,
    "creator": {
      "userID": 19251,
      "name": "Mike Topo",
      "username": "TopoMaschio",
      "profilePhotoSmall": "http://avatars-polarb-com.a.ssl.fastly.net/000/019/251/19251-small_retina-6cd9fe6fbbca3bd8.jpg"
    },
    "choices": [
      {
        "name": "Driveclub",
        "sortOrder": 1,
        "voteCount": 7
      },
      {
        "name": "The Crew",
        "sortOrder": 2,
        "voteCount": 5
      }
    ],
    "images": [
      {
        "sortOrder": 1,
        "url": "http://polls-polarb-com.a.ssl.fastly.net/000/153/722/153722-1-medium-34615e8fee6b5176.jpg",
        "largeUrl": "http://polls-polarb-com.a.ssl.fastly.net/000/153/722/153722-1-large-34615e8fee6b5176.jpg"
      }
    ],
    "voteCount": 12,
    "favoriteCount": 0,
    "commentCount": 1,
    "comments": [
      {
        "commentID": 258899,
        "body": "#2014games2play",
        "date": "2014-01-20T13:28:56Z",
        "userID": 19251,
        "username": "TopoMaschio",
        "profilePhotoSmall": "http://avatars-polarb-com.a.ssl.fastly.net/000/019/251/19251-small_retina-6cd9fe6fbbca3bd8.jpg"
      }
    ]
  },
  ...
]
</pre>
