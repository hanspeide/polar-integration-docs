## Polar API

Requirements for using the Polar API:

* Polar reserves the right to revoke developer accounts if the integration does not meet our standards for appearance or interaction.
* The presenation of Polar content must include Polar branding.
* [Contact us](http://polarb.com/contact) and let us know you are interested in using it: we'll talk through the two points above.

### Production and test accounts

The base URL for all **production** API's is:

<pre>
https://polarb.com/api/v4
</pre>

For **testing**, the base URL can point to our staging servers:

<pre>
https://polar-rails-staging.herokuapp.com/api/v4
</pre>

If you plan on using an API endpoint which requires authentication (see below), you will need to sign up at a polar account on each environment you wish to use:

Create a development account:
[https://polar-rails-staging.herokuapp.com/join]()

Create a production account: 
[http://polarb.com/join]()

### API endpoints

* [Get user information](#userinfo)
* [Authentication](#authentication)
* [Get a list of recent polls](#recentpolls)
* [Vote on a poll](#voting)
* [Create a poll](#createpoll)

### <a name="userinfo"></a> Get user information

Get credentials for the current user viewing the polls

**If the user is not authenticated**

<pre>
GET /users/me
</pre>

Returns the following if the user **is not authenticated:**

```JSON
{
  "anonymousUserID": "d611093317bbe73c6327773b551af0c646b8cb9cefe57ef7b0dd3862c711"
}
```

Returns the following if the user **is authenticated:**

```JSON
{
  "userID": 1,
  "username": "jcole",
  "name": "Jeffrey",
  "location": "Newton, MA",
  "url": "/users/jcole",
  "twitter_username": "jeff_cole",
  "profilePhotoLarge": "http://polar-development-avatars-jeff.s3.amazonaws.com/000/000/001/1-large_retina-dc41e6a5a7d95012.jpg",
  "profilePhotoSmall": "http://polar-development-avatars-jeff.s3.amazonaws.com/000/000/001/1-small_retina-dc41e6a5a7d95012.jpg",
  "authToken": "xxAuthTokenHerexx",
}
```

### <a name="authentication"></a> Authentication

Log in and get user credentials.

<pre>
POST /users/authenticate
</pre>

Param | Type | Required | Description
-----|------|----------|--------------
email_or_username| string | required | User's Polar username or email.  Case insensitive.
password | string | required |User's Polar password.

Returns:

```JSON
{
  "userID": 1,
  "username": "jcole",
  "name": "Jeffrey",
  "location": "Newton, MA",
  "url": "/users/jcole",
  "twitter_username": "jeff_cole",
  "profilePhotoLarge": "http://polar-development-avatars-jeff.s3.amazonaws.com/000/000/001/1-large_retina-dc41e6a5a7d95012.jpg",
  "profilePhotoSmall": "http://polar-development-avatars-jeff.s3.amazonaws.com/000/000/001/1-small_retina-dc41e6a5a7d95012.jpg",
  "website": "",
  "about": "About Me",
  "pollsCreatedCount": 490,
  "pollsVotedOnCount": 195,
  "votesReceivedCount": 1274,
  "favoriteCount": 60,
  "favoritesReceivedCount": 39,
  "commentsCount": 240,
  "commentsReceivedCount": 307,
  "followingCount": 3,
  "followedByCount": 7,
  "success": true,
  "email": "jeff@test.com",
  "confirmed": true,
  "authToken": "xxAuthTokenHerexx",
  "following_ids": [45, 337, 338],
  "favorite_poll_ids": [294, 645, 652,]
}
```

### <a name="recentpolls"></a> Get a list of recent polls

Get a list of recent popular polls on Polar.  Returns a set of 10 polls.  

To get the next 10 polls, use the `before_poll_id` parameter.

Authentication is not required for this endpoint.

<pre>
GET /polls
</pre>

Param | Type | Required | Description
-----|------|----------|--------------
before_poll_id | number | optional | Get the next set of polls prior to this poll id.

```JSON
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
```

### <a name="voting"></a> Vote on a poll

Vote on a poll for a user.  Note: voting multiple times on a poll for the same user will not create an additional vote: it will either switch the vote choice (if the choice has changed) or result in a no-op (if the choice remained the same).

<pre>
POST /polls/:poll_id/votes
</pre>

Param | Type | Required | Description
-----|------|----------|--------------
poll_id| number | required | The ID of the poll to vote on.
password | string | required |User's Polar password.
option | number | required | The choice the user is voting on: either *1* (first choice) or *2* (second choice).
auth_token | string | optional | Then Polar authentication token for the user voting, if the user has a Polar account.  As returned by *authToken* in the [authentication](#authentication) endpoint.
anonymous_user_id | string | optional | Then identification of the user voting, if the user does not have a Polar account.  See [authentication](#authentication) for users without a Polar account to get this value.

**Note:** one of either `auth_token` or `anonymous_user_id` is required.

Returns:

```JSON
{ 
  "success": true
}
```

### <a name="createpoll"></a> Create a poll

Creating a poll requires three steps:

1. Post your poll to Polar.
2. Take the returned S3 credentials and upload your poll image to S3.
3. Notify Polar that the images have finished uploading.

*Note about images:* even though some Polar polls appear to have two images, it is really one image of the two composited side-by-side.  At this time, the client is responsible for doing this -- so yours will have to, as well.

**Post your poll to Polar**

<pre>
POST /polls
</pre>

Param | Type | Required | Description
-----|------|----------|--------------
caption | string | required | The question to ask in the poll, e.g. "Which phone do you prefer?"
choice1 | string | required | The text for the first choice, e.g. "iPhone for sure!"
choice2 | string | required | The question to ask in the poll, e.g. "Android all the way"
auth_token | string | required | Then Polar authentication token for the user creating the poll.  As returned by *authToken* in the [authentication](#authentication) endpoint.

Returns:

```JSON
{
  "pollID": 815,
  "url": "http://localhost:3000/815-test-pol",
  "shortUrl": "http://localhost:3000/815",
  "caption": "Test Pol?",
  "pollType": "single-photo",
  "created": "2014-01-13T15:53:59Z",
  "public": false,
  "private": false,
  "creator": {
    "userID": 1,
    "name": "Jeffrey",
    "username": "jcole",
    "profilePhotoSmall": "http://polar-development-avatars-jeff.s3.amazonaws.com/000/000/001/1-small_retina-dc41e6a5a7d95012.jpg"
  },
  "choices": [{
    "name": "Yes",
    "sortOrder": 1,
    "voteCount": 0,
    "isWinning": false
  }, {
    "name": "No",
    "sortOrder": 2,
    "voteCount": 0,
    "isWinning": false
  }],
  "images": [
    // these don't exist until step 3!
  ],
  "voteCount": 0,
  "favoriteCount": 0,
  "commentCount": 0,
  "comments": [

  ],
  "firstChoiceName": "Yes",
  "secondChoiceName": "No",
  "firstChoiceVoteCount": 0,
  "secondChoiceVoteCount": 0,
  "firstChoicePercentage": 0,
  "secondChoicePercentage": 0,
  "firstWinning": false,
  "secondWinning": false,
  "image": null,
  "imageID": 797,
  "uploadData": { // used for s3 upload
    "postUrl": "https://polar-development-upload-jeff.s3.amazonaws.com",
    "formData": {
      "AWSAccessKeyId": "AKIAJNT4KV2W2N6XPSFA",
      "policy": "eyJleHBpcmF0aW9uIjoiMjAxNC0wMS0xNFQwMTo1NDowMFoiLCJjb25kaXRpb25zIjpbWyJjb250ZW50LWxlbmd0aC1yYW5nZSIsMCw0MDk2MDAwXSx7IkNvbnRlbnQtVHlwZSI6ImltYWdlL2pwZWcifSx7ImtleSI6IjAwMC8wMDAvODE1LzgxNS0xLW9yaWdpbmFsLTZjNDJkYTUwZTg1YWI0MWMuanBlZyJ9LHsiYnVja2V0IjoicG9sYXItZGV2ZWxvcG1lbnQtdXBsb2FkLWplZmYifSx7ImFjbCI6InByaXZhdGUifV19",
      "signature": "z7Wts+wj+df68RvWWziqfYn7OxI=",
      "key": "000/000/815/815-1-original-6c42da50e85ab41c.jpeg",
      "acl": "private",
      "Content-Type": "image/jpeg"
    }
  }
}
```

**Upload your poll images to S3**

The response from creating your poll in last step will return JSON that has your S3 upload credentials in the `uploadData` attribute, e.g.:

```JSON
"uploadData": {
  "postUrl": "https://polar-development-upload-jeff.s3.amazonaws.com",
  "formData": {
    "AWSAccessKeyId": "AKIAJNT4KV2W2N6XPSFA",
    "policy": "eyJleHBpcmF0aW9uIjoiMjAxNC0wMS0xNFQwMTo1NDowMFoiLCJjb25kaXRpb25zIjpbWyJjb250ZW50LWxlbmd0aC1yYW5nZSIsMCw0MDk2MDAwXSx7IkNvbnRlbnQtVHlwZSI6ImltYWdlL2pwZWcifSx7ImtleSI6IjAwMC8wMDAvODE1LzgxNS0xLW9yaWdpbmFsLTZjNDJkYTUwZTg1YWI0MWMuanBlZyJ9LHsiYnVja2V0IjoicG9sYXItZGV2ZWxvcG1lbnQtdXBsb2FkLWplZmYifSx7ImFjbCI6InByaXZhdGUifV19",
    "signature": "z7Wts+wj+df68RvWWziqfYn7OxI=",
    "key": "000/000/815/815-1-original-6c42da50e85ab41c.jpeg",
    "acl": "private",
    "Content-Type": "image/jpeg"
  }
}
```

You can use this information to post the image to the S3 `postUrl` with the provided credentials.  Here is an example of how that would be done in JS with jQuery:

```Javascript
var fd = new FormData();
fd.append('AWSAccessKeyId', formData.AWSAccessKeyId);
fd.append('policy', formData.policy);
fd.append('signature', formData.signature);
fd.append('key', formData.key);
fd.append('acl', formData.acl);
fd.append('Content-Type', "image/jpeg");
fd.append('file', myImageFile, 'poll-image.jpeg');

$.ajax({
  url: url,
  type: "POST",
  data: fd,
  processData: false,  // tell jQuery not to process the data
  contentType: false   // tell jQuery not to set contentType
})
.done(function(data) {
  // success!!
})
.fail(function( jqXHR, textStatus, errorThrown ) {
  // error
});
``` 

**Notify Polar that the images have finished uploading**

This lets Polar know that the poll is ready to be seen and thumbnail versions of the poll image can be created.  Call this endpoint after you have uploaded your images to S3.

<pre>
POST /polls/:poll_id/image_uploaded
</pre>

Param | Type | Required | Description
-----|------|----------|--------------
poll_id| number | required | The ID of the poll that we are creating.  Returned in the response from the first step.
image_id | number | required | The ID of the image that was uploaded.  Returned in the response from the first step. (Note: the current version of Polar only uses one image per poll, so future verisons of the API can drop the requirement for this parameter.)
auth_token | string | required | Then Polar authentication token for the user creating the poll.  As returned by *authToken* in the [authentication](#authentication) endpoint.
first_image_full_url| string | optional | The URL for the the image for the first choice (if applicable).
first_image_context_url| string | optional | The URL for the web site where the image for the first choice can be found (if applicable).
first_public_domain| boolean | optional | Indicates whether the image for the first choice is public domain
second_image_full_url| string | optional | The URL for the the image for the second choice (if applicable).
second_image_context_url| string | optional | The URL for the web site where the image for the second choice can be found (if applicable).
second_public_domain| boolean | optional | Indicates whether the image for the second choice is public domain

Returns:

```JSON
{ 
  "success": true
}
```