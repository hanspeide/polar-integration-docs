## Integrating Polar Polls into your Website or App

![Example Polar embedded poll](https://polar-production-web-assets.s3.amazonaws.com/pub-promo-addsite.png)

[Polar polls](http://polarb.com/polls) can be integrated into your website or native app.  There are two ways to do this:
 
* using a `<script>` [tag we provide](/embed_component.md) that will load a custom Javascript component inside an iframe.  We handle displaying the polls and voting for you.
* using our HTTP/JSON-based [API](/api/v4/index.md).  You handle rendering the polls and allowing users to vote.

### Embed tag

The easiest way is via the script tag, which loads a light-weight, self-rendering javascript component wrapped in an iFrame.  This component is based on industry standard third-party JS best practices to ensure safe usage in your site.

With this approach, we've done all the hard work to make the polls
[look good at various sizes](http://polarb.com/publishers/poll_sets/926/preview) and for various clients.  Plus, we've handled all the logic for transitioning between polls and allowing users to vote on polls.  

If you already see polls on Polar that you want to embed, or can make your own polls using our [web based poll creation tool](http://www.polarb.com/howtos/makepolls), this is the way to go.  Start reading about the [embed component](/embed_component.md) here.

### API

If you require a tighter integration of Polar polls into your app, you can use our API to pull poll data and render the poll yourself.   You will also need handle the poll transition and voting actions yourself, using our API.

Using the API comes with some caveats:

* the API was originally written to support our native iOS app and web client, not for third-party developers.  As such, there are a few items that could be cleaned up.  Furthermore, as our app evolves, the API may evolve as well
* Polar reserves the right to revoke developer accounts if the integration does not meet our standards
* integrated Polar content must include Polar branding

If you think using the API is for you, [contact us](http://polarb.com/contact), and head over to the [API docs](/api/v4/index.md).


