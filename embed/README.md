## Embedding Polls via tag

You can load a `<script>` or `<iframe>` tag into your website.  This tag loads a light-weight (~30kb), self-rendering Javascript component wrapped in an iFrame.  This component responsively renders the polls and handles user interaction such as voting and poll navigation.  Customization is done via HTML5 data tags.

[Example of embedded polls with responsive sizing](http://polarb.com/publishers/poll_sets/926/preview)


[Techical details about the Javascript component](#techdetails)

### script tag

Example:

```HTML
<script src="http://assets-polarb-com.a.ssl.fastly.net/assets/polar-embedded.js" 
 async="true" 
 data-publisher="jcole"
 data-poll-set="926"></script>
```

Param | Type | Required | Description
-----|------|----------|--------------
data-publisher| string | required | User's Polar username or email.  Case insensitive.
data-poll-set | number | optional | Poll Set ID.  Use this parameter if you want to embed a poll set.
data-poll-id | number | optional | Poll ID. Use this parameter if you want to embed a single poll.

**Note:** one of either `data-poll-set` or `data-poll-id` is required.
  
See the included [test\_script\_embed.html](test_script_embed.html) web page in this repository for a working eample.

### iframe

Some hosting providers may not let you embed a script page into your content (for example, Wordpress.com).  In this case, use the following `<iframe>` instead.  It will load the same content as the script tag.  The drawback here is that you need to specify a fixed size for the iframe container: we can't responsively resize this iframe based on your clients' screen sizes.

Example:

```HTML
<iframe seamless="seamless" style="border: none; overflow: hidden;" scrolling="no"
 height="450" width="100%" 
 src="http://assets-polarb-com.a.ssl.fastly.net/api/v4/publishers/<publisher name>/embedded_polls/iframe?pollset_id=<poll set ID>"></iframe>
```

Param | Type | Required | Description
-----|------|----------|--------------
publisher name | string | required | User's Polar username or email.  Case insensitive.
pollset_id | number | optional | Poll Set ID.  Use this parameter if you want to embed a poll set.
poll_id | number | optional | Poll ID. Use this parameter if you want to embed a single poll.

**Note:** one of either `pollset_id` or `poll_id` is required.  

See the included [test\_iframe\_embed.html](test_iframe_embed.html) web page in this repository for a working eample.

### <a name="techdetails"></a> Technical details about the Javascript component

Loading Polar polls via embed script tag will load a light-weight (~30kb), self-rendering Javascript component wrapped in an iFrame.

This embed tag is easy to use, safe, and fast.  It will load asynchronously and reliably over our Fastly CDN after your content and render itself in an iFrame.  Only one, optimized AJAX request is made to pull the latest poll data for your reader.  Javascript execution is wrapped in an anonymous closure and wrapped in error handling to prevent interfering with your page.  Styling Polar Embedded provides the best of both worlds - an isolated iFrame container for HTML/CSS, but interfaces to apply custom CSS. Polar Embedde is cross-browser safe supporting IE/Firefox/Safari and major mobile browsers using progressively enhanced Javascript and responsive HTML/CSS design.

The main Polar Embedded Javascript library is concatenated, minified, and gzipped before being deployed on a global Fastly CDN (powering Twitter, The Guardian, Github, etc).  The Javascript application includes all of its own depdencies, executes within an anonymous closure, and does not pollute/collide with the global window namespace.  A single AJAX request to Polar APIs initializes the polls to be shown and publisher configuration. Readers voting on polls trigger AJAX API requests to track votes in the Polar backend.

Where the `<script>` tag is placed on the page, an iFrame is added to the page DOM.  Polar Embedded then renders its HTML/CSS into this iFrame locally without network requests.  Behavior within Polar Embedded is implemented using an embedded jQuery in compatibility mode isolated from the parent page.  Additional embedding formats like a isolated `<iFrame>` tag, `oEmbed`, or `Embed.ly` are also available.

Mobile webviews in iOS/Android can target the iFrame API which serves up a minimal page displaying an embedded poll anywhere within an existing mobile app.

Responsive design and custom publisher CSS allow Polar to flow with your layout at any screen size.  CSS may be applied to the Polar Embedded container to position/size the polls on your page.  Internal CSS can be applied to the Polar Embedded iFrame to use custom fonts, colors, look, and feel of the application to match your site.  Polar Polls can handle screens or web cards as small as 300px wide, but scale up to full size desktop layouts for articles.
