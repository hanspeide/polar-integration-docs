## Polar SDK and API documentation

### How to add Polar polls to your site or native app

![Example Polar embedded poll](https://polar-api-docs-assets.s3.amazonaws.com/pub-promo-addsite.png)

[Polar](http://polarb.com) polls are a great way to give your audience a voice.  This documentation is intended for developers who want to integrate Polar polls into their website or native app.

### What can I embed on my site?

You can embed either a single poll, or a series of polls ("poll set").  Both will appear the same on your site. A poll set displays one poll at a time and will automatically transition to the next poll after the viewer votes.

Example of an **embedded single poll**: <br />
[http://www.forbes.com/sites/davidthier/2013/11/05/the-5-best-reasons-for-buying-the-xbox-one-instead-of-a-ps4/](http://www.forbes.com/sites/davidthier/2013/11/05/the-5-best-reasons-for-buying-the-xbox-one-instead-of-a-ps4/)

Example of an **embedded poll set**: <br />
[http://9to5mac.com/2013/11/06/iphone-5s-vs-nexus-5-photo-smackdown-vote-which-images-are-the-best/](http://9to5mac.com/2013/11/06/iphone-5s-vs-nexus-5-photo-smackdown-vote-which-images-are-the-best/)

In both cases, we handle the responsive sizing and user interaction for you.

### Getting started

The first thing you should do is create a Polar account: <br />
[http://polarb.com/join](http://polarb.com/join)

We recommend also creating a test account on our staging site also, as a sandbox for your test content: <br />
[https://polar-rails-staging.herokuapp.com/join](https://polar-rails-staging.herokuapp.com/join)

Next, log in to the Polar website and check out the "How Tos" to start making some great-looking polls or poll sets.  You can either create your own, or borrow existing content from our community:  <br />
[How to create polls and poll sets](http://www.polarb.com/howtos)

After you've picked out your content, you're ready to embed some polls on your site.

### Embedding polls
 
There are a few options for embedding polls:

[Embed tag](/embed): the preferred approach. We give you a `<script>` or `<iframe>` tag that you embed in your web page.  The tag will insert an iframe containing the polls.

[iOS SDK](/ios-sdk): Cocoa Touch classes that you can include in your iOS project.  The classes will create a UIWebView containing the embedded polls.

The display of the polls can be customized to match the font, colors, and look of your site. <br />
[Display customizations](/display-guidelines#customization)

### Non-embed options

[API](/api/v4): If you prefer to handle the display and user interaction yourself, you can use Polar's HTTPS/JSON-based API to access the data directly.  Note that your display of Polar content must adhere to our [display guidelines](/display-guidelines).

[Android](https://github.com/hanspeide/polar-android):  We don't have an Android SDK.  However, one of our great fans, [Hans Petter Eide](https://github.com/hanspeide), created a working version of Polar for Android.

### Contact us

Need a hand getting started?  We're happy to help: [Polar support](mailto:support@polarb.com).
