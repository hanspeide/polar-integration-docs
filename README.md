## Polar SDK and API documentation

### How to add Polar polls to your site or native app

![Example Polar embedded poll](https://polar-api-docs-assets.s3.amazonaws.com/pub-promo-addsite.png)

[Polar](http://polarb.com) polls are a great way to give your audience a voice.  This documentation is intended for developers who want to integrate Polar polls into their website or native app.

### Embedded Polls and Poll Sets

You can embed either a single poll, or a series of polls ("poll set").  Both will appear the same on your site. The difference is that a poll set displays a series of polls one poll at a time, automatically transitioning to the next poll after the viewer votes.

**Examples**

Embedded single poll <br />
[http://www.forbes.com/sites/davidthier/2013/11/05/the-5-best-reasons-for-buying-the-xbox-one-instead-of-a-ps4/](http://www.forbes.com/sites/davidthier/2013/11/05/the-5-best-reasons-for-buying-the-xbox-one-instead-of-a-ps4/)

Embedded poll set<br />
[http://9to5mac.com/2013/11/06/iphone-5s-vs-nexus-5-photo-smackdown-vote-which-images-are-the-best/](http://9to5mac.com/2013/11/06/iphone-5s-vs-nexus-5-photo-smackdown-vote-which-images-are-the-best/)

### How To Embed them in your Website or App

We have several options to embed polls in your website or app where we handle the responsive sizing and user interaction for you.  We call these **embedded poll** solutions.  
 
[Embed tag](/embed)<br />
The preferred approach. We give you a `<script>` or `<iframe>` tag that you embed in your web page.  The tag will insert an iframe containing the polls.

[iOS SDK](/ios-sdk)<br />
Cocoa Touch classes that you can include in your iOS project.  The classes will create a UIWebView containing the embedded polls.

[Android SDK](/android-sdk)<br />
Classes that you can include in your Android project.  These will create a WebView containing the embedded polls.

Embedded solutions are great because we've done all the hard work for you.  You can even customize the colors and fonts of embedded polls to match your site [(see customization)](/display-guidelines#customization).  However, you may need more customization over how the polls are integrated in your site or app.  In that case, you can use the API directly to access Polar data.  Note that you will be responsible for handling all the user interaction; also, the display of Polar content must adhere to our [display guidelines](/display-guidelines).

[API](/api/v4)<br />
Polar's HTTPS/JSON-based API

### Using Placements to easily change the embedded content
 
If you want to change the poll or poll set embedded on your website *without* changing the code you used to integrate Polar polls, use a *placement*.  On the Polar website, you can create named placements, like "home page", "sports page", "entertainment section", etc. Through the website, you can specify which polls or poll sets should show up in that placement

When embedding your polls via tag or iOS SDK, simply specify the placement instead of the specific poll/poll set (see documentation for details).  The polls that appear will be the ones you selected for that placement.  When you change the polls for that placement via the Polar website, you should see the polls embedded in your placement change instantaneously.


### Getting started

The first thing you should do is create a Polar account: <br />
[http://polarb.com/join](http://polarb.com/join)

We recommend also creating a test account on our staging site also, as a sandbox for your test content: <br />
[https://polar-rails-staging.herokuapp.com/join](https://polar-rails-staging.herokuapp.com/join)

Next, log in to the Polar website and check out the "How Tos" to start making some great-looking polls or poll sets.  You can either create your own, or borrow existing content from our community:  <br />
[How to create polls and poll sets](http://www.polarb.com/howtos)

After you've picked out your content, you're ready to embed some polls on your site.

### Contact us

Need a hand getting started?  We're happy to help: [Polar support](mailto:support@polarb.com).
