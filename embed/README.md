## Embedding Polls via tag

You can embed polls on your website via a `<script>` or `<iframe>` tag as described below.  The tag loads a light-weight (~30kb), self-rendering Javascript component wrapped in an iframe.  This component responsively renders the polls and handles user interaction such as voting and poll navigation. 

The script tag is the recommended approach, since it can resize the embed based on your page content and the client's screen size.  With the the iframe method, you must specify the width and height of the iframe.  So, it is your responsibility to adjust this iframe size on each page load to appropriately match the client's screen size.

Either way, once the embedded polls container size is set, Polar will responsively size the poll content for the container: <br />
[Example of responsive sizing](http://polarb.com/publishers/poll_sets/926/preview)

### Getting the tags

Your embed tag must specify one of the following:

* A **poll** to display
* A **poll set** to display
* A named **placement** that you have created

**Polls and Poll Sets**

If you know the poll or poll set you want to embed, you can simply customize the script tags with the unique numeric ID's for the polls or poll sets, as described in the sections below.  The ID's for the polls and poll sets can be found on the polarb.com website either in the [URL for the poll or poll set](http://polarb.com/publishers/results/poll_sets/926), or in the embed code displayed when you click "share" or "publish":

![Example of embed code tag in website](https://polar-api-docs-assets.s3.amazonaws.com/embed-code-example.png)

**Placements**

If you want to change the poll or poll set on your website *without* changing the embed tag, use a placement.  You can have a variety of named placements, like "home page", "sports page", "entertainment section", etc., that you maintain on the Polarb.com website.  Then, through the Polarb.com website, you can change which poll set should show in each named placement.

![Example of embed placement in website](https://polar-api-docs-assets.s3.amazonaws.com/embed-placement.png)

### Testing environment

If you want to test creating an embedding content in a non-production environment, simply log into [Polar's test site](https://polar-rails-staging.herokuapp.com/join) and create an account there.  Any polls, poll sets, or votes you create there will show up only on the test site.  The examples below describe how to modify your tags for the testing environments.

### Using the `<script>` tag

This is the recommended method, as Polar can resize to the alloted space on your page.  Customization is done via HTML5 data tags.  

```HTML
<script src="http://assets-polarb-com.a.ssl.fastly.net/assets/polar-embedded.js" 
 async="true" 
 data-publisher="jcole"
 data-poll-set="926"></script>
```

Param | Type | Required | Description
-----|------|----------|--------------
data-publisher| string | required | User's Polar username.
data-poll-set | number | optional | Poll Set ID.  Use this parameter if you want to embed a poll set.
data-poll-id | number | optional | Poll ID. Use this parameter if you want to embed a single poll.
data-placement | string | optional | Name you created for the placement on your site, e.g. "home-page" or "sidebar".

**Note:** one of either `data-poll-set`, `data-poll-id`, or `data-placement` is required.  Use `data-placement` when you want don't want to embed a specific poll or poll set.  Instead, this allows you to swap in a new poll or poll set to this placement instantaneously via the Polar website.

If you want test your embed against Polar's **testing** server, just modify the `src` attribute like the following:

**Production** <br />
<pre>
http://assets-polarb-com.a.ssl.fastly.net/assets/polar-embedded.js
</pre>

**Testing** <br />
<pre>
https://polar-rails-staging.herokuapp.com/assets/polar-embedded.js
</pre>
  
See the included [test\_script\_embed.html](test_script_embed.html) web page in this repository for a working eample.

### Using the `<iFrame>` tag

Although the script tag is the recommended approach, some hosting providers don't allow you to add a script tag page into your page (for example, Wordpress.com).  In this case, use the following `<iframe>` instead.  It will load the same content as the script tag.  However, you will need to specify a height and width for the iframe yourself.  Note that the minimum space needed for polls to render is **300x300px**.

In this example, the iframe is set to height of 450px:

```HTML
<iframe seamless="seamless" style="border: none; overflow: hidden;" scrolling="no"
 height="450" width="100%" 
 src="http://assets-polarb-com.a.ssl.fastly.net/api/v4/publishers/<publisher name>/embedded_polls/iframe?pollset_id=<poll set ID>"></iframe>
```

Param | Type | Required | Description
-----|------|----------|--------------
publisher name | string | required | User's Polar username.
pollset_id | number | optional | Poll Set ID.  Use this parameter if you want to embed a poll set.
poll_id | number | optional | Poll ID. Use this parameter if you want to embed a single poll.
placement | string | optional | Name you created for the placement on your site, e.g. "home-page" or "sidebar".

**Note:** one of either `pollset_id` or `poll_id` or `placement` is required.  Use `placement` when you want don't want to embed a specific poll or poll set.  Instead, this allows you to swap in a new poll or poll set to this placement instantaneously via the Polar website.

If you want test your embed against Polar's **testing** server, just modify the `src` attribute like the following:

**Production** <br />
<pre>
http://assets-polarb-com.a.ssl.fastly.net/api/v4/publishers
</pre>

**Testing** <br />
<pre>
https://polar-rails-staging.herokuapp.com/api/v4/publishers
</pre>

See the included [test\_iframe\_embed.html](test_iframe_embed.html) web page in this repository for a working eample.

### <a name="techdetails"></a> Technical details about the Javascript

Both the `<script>` and `<iframe>` embed tags will load a light-weight (~30kb), self-rendering Javascript component wrapped in an iFrame.

This embed tag is easy to use, safe, and fast.  It will load asynchronously and reliably over our Fastly CDN after your content and render itself in an iFrame.  Only one, optimized AJAX request is made to pull the latest poll data for your reader.  Javascript execution is wrapped in an anonymous closure and wrapped in error handling to prevent interfering with your page.  Styling Polar Embedded provides the best of both worlds - an isolated iFrame container for HTML/CSS, but interfaces to apply custom CSS. Polar Embedde is cross-browser safe supporting IE/Firefox/Safari and major mobile browsers using progressively enhanced Javascript and responsive HTML/CSS design.

The main Polar Embedded Javascript library is concatenated, minified, and gzipped before being deployed on a global Fastly CDN (powering Twitter, The Guardian, Github, etc).  The Javascript application includes all of its own depdencies, executes within an anonymous closure, and does not pollute/collide with the global window namespace.  A single AJAX request to Polar APIs initializes the polls to be shown and publisher configuration. Readers voting on polls trigger AJAX API requests to track votes in the Polar backend.

Where the tag is placed on the page, an iFrame is added to the page DOM.  Polar Embedded then renders its HTML/CSS into this iFrame locally without network requests.  Behavior within Polar Embedded is implemented using an embedded jQuery in compatibility mode isolated from the parent page. 

Responsive design and custom publisher CSS allow Polar to flow with your layout at any screen size.  CSS may be applied to the Polar Embedded container to position/size the polls on your page.  Internal CSS can be applied to the Polar Embedded iFrame to use custom fonts, colors, look, and feel of the application to match your site.  Polar Polls can handle screens or web cards as small as 300px wide, but scale up to full size desktop layouts for articles.

### Browser Support

We aim to support the last 3 major releases of each popular browser.

* Firefox (last three major releases)
* Chrome (last three major releases)
* Internet Explorer (IE 9, 10, 11)
 

### Using the JavaScript API

For complete control over the Polar embedded polls experience, we provide a JavaScript application and API.  Instead of embedding the self-render `polar-embedded.js` scrip on your page, you can load the `polar-embedded-standalone.js` application.  This provides the actual `EmbeddedPollsApp` component for you to customize.

```html
<!-- This version does not bundle jQuery, use Polar's jQuery 2.0.3 or your own -->
<script src="http://assets-polarb-com.a.ssl.fastly.net/assets/jquery-2.0.3.min.js"></script>
<!-- Load the PolarEmbeddedPolls application via the polar-embedded-standalone.js library -->
<script src="http://assets-polarb-com.a.ssl.fastly.net/assets/polar-embedded-standalone.js"></script>

<script>
  $(document).ready(function() {
    var target = $('.polar-polls');
    var polarOptions = {
      pollId: '1234-is-this-awesome'
    };
    
    //Instantiate new EmbeddedPollsApp showing a single Poll by ID
    var polar = new EmbeddedPollsApp(target, polarOptions);
    polar.init();
  });
</script>

<div class="polar-polls">
</div>
```

**EmbeddedPollsApp Options**

The following options can be set in the options has passed in when initializing the `EmbeddedPollsApp`.

* `pollId` - Embed a Poll by ID (eg: `1234-what-is-awesome`)
* `pollSetId` - Embed a Poll Set by ID (eg: `1234-this-is-a-pollset`)
* `tag` - Embed Polls tagged with `tag` (eg: `travel`)
* `placement` - Embed a named Placement, whose content can be filled in the Polar Publisher Portal (eg: `homepage`)
* `callbacks` - A hash of events and associated JS callbacks (eg: `{ vote: function(data) { ... }}`)


**EmbeddedPollsApp Events**

The `EmbeddedPollsApp` fires a number of events and customers can provide callbacks to be notified when an event occurs.  Every callback takes a data hash as a single parameter and provides different items related to the event.

* `loaded({app})` - After the `EmbeddedPollsApp` has completed loading, the `loaded` event is fired. `app` parameter in this event is the instance of the EmbeddedPollsApp that has just loaded.
* `vote({pollID, choice})` - Whenever a user votes on a poll, the `vote` event is fired with the `pollID` and `choice` parameters identifying which choice the user selected on this poll.
* `navigate({direction, currentPollID, nextPollID})` - When a user transitions from one poll to another, the `navigate` event is fired with the following parameters: `direction` as `next` or `previous`, `currentPollID` as the active poll before the navigation, and `nextPollID` as the new poll being transitioned to.
* `lastPoll` - When the user has voted/navigated through all of the available polls.

**EmbeddedPollsApp instance API**

The following methods can be called on a loaded `EmbeddedPollsApp` instance.

* `getUser()` - Returns a hash identifying the active user, either a registered Polar user (eg: `{ userID: 1234 }`) or the current anonymous user ID (eg: `{ anonymousUserID: 'bef9dcdc...' }`)
* `getVotes()` - Returns an array of Vote hashes, containing the poll and choice IDs for that vote (eg: `[{ pollID: 1234, choice: 1 }, ...]`)
