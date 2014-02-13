## Polar SDK and API documentation

### Adding Polar polls to your site or native app

![Example Polar embedded poll](https://polar-production-web-assets.s3.amazonaws.com/pub-promo-addsite.png)

[Polar](http://polarb.com) polls are a great way to give your audience a voice.   Here we describe the kinds Polar content you can include on your site and the technical options for integrating them.

### What kinds of Polar content can I embed on my site?

You can embed either a single poll, or a set of polls ("poll set"):

**Example of an embedded single poll** <br />
[http://www.forbes.com/sites/davidthier/2013/11/05/the-5-best-reasons-for-buying-the-xbox-one-instead-of-a-ps4/](http://www.forbes.com/sites/davidthier/2013/11/05/the-5-best-reasons-for-buying-the-xbox-one-instead-of-a-ps4/)

**Example of an embedded poll set** <br />
[http://9to5mac.com/2013/11/06/iphone-5s-vs-nexus-5-photo-smackdown-vote-which-images-are-the-best/](http://9to5mac.com/2013/11/06/iphone-5s-vs-nexus-5-photo-smackdown-vote-which-images-are-the-best/)

They will both have the same great, responsive appearance when embedded in your site.  The only difference is a poll set will automatically transition to the next poll after the user votes.  A poll set is a great way to ask a series of related questions.

### How do I embed them?
 
We give you a few options for integrating Polar polls and poll sets into your site or native app:

#### Embed tag

With a `<script>` or `<iframe>` tag that you embed in your web page, we will responsively render your polls and handle all the user interaction such as voting and poll navigation.  We recommend this approach, as we've done all the hard work for you.

[Embed tag documentation](/embed)

#### iOS SDK

With Polar's iOS SDK, you can integrate polls directly into your native iOS app.  Here, we also handle the display and user interaction.

[iOS SDK documentation](/ios-sdk)

#### Android SDK

We don't have an official Android SDK, but one of our great community members, [Hans Petter Eide](https://github.com/hanspeide) created this working version of Polar for Android:

[https://github.com/hanspeide/polar-android](https://github.com/hanspeide/polar-android)

#### HTTPS/JSON API

If you prefer to handle the display and user interaction yourself, you can use Polar's HTTPS/JSON-based API to access the data directly.  Note that if you are displaying content yourself, you must adhere to Polar's [display guidelines](/display-guidelines).

[API documenation](/api/v4)

### Where do I get the polls and poll sets from?

It's easy to create your own great looking polls and poll sets on Polar.  But if you'd like to use some of the polls our community has [already made](http://polarb.com/polls), you can do that, too.   Either way, our "How To" will help you get started:

[How to create polls and poll sets on Polar](http://www.polarb.com/howtos)

### Getting started

The first thing you should do is create a Polar account: <br />
[http://polarb.com/join](http://polarb.com/join)

We recommend also creating a test account also, as a sandbox for your test content: <br />
[https://polar-rails-staging.herokuapp.com/join](https://polar-rails-staging.herokuapp.com/join)

Next, log in to the Polar website and check out the "How Tos" to start making some great-looking polls or poll sets: <br />
[How To's](http://www.polarb.com/howtos)

After you've picked out some great content, you're ready to start displaying Polar polls in your site using whichever integration method described above is best for you.

### Contact us

Need a hand?  We're happy to help you get started or answer any questions you might have: <br />
[Contact us](mailto:support@polarb.com)
