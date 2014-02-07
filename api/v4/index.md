## Polar API

About the API:

* the API was originally written to support our native iOS app and web client, not for third-party developers.  As such, there are a few items that could be cleaned up.  Furthermore, as our app evolves, the API may evolve as well
* Polar reserves the right to revoke developer accounts if the integration does not meet our standards
* integrated Polar content must include Polar branding

If you think using the API is for you, [contact us](http://polarb.com/contact).

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

<pre>
http://polarb.com/join (production)
https://polar-rails-staging.herokuapp.com/join (testing)
</pre>

### API

**endpoints which do not require authentication**

* [Get a list of recent polls](#recentpolls)

**endopint for authentication**

* [Authentication](#authentication)

**endpoints which require authentication**

* [Vote on a poll](#voting)
* [Create a poll](#createpoll)

### <a name="recentpolls"></a> Get a list of recent polls

Get a list of recent popular polls on Polar.  Returns a set of 10 polls.  To get the next 10 polls, use the `before_poll_id` parameter.

<pre>
GET /polls
</pre>

Name | Type | | Description
-----|------|-|--------------
`before_poll_id`| number | optional | Get the next set of polls prior to this poll id.

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

### <a name="authentication"></a> Authentication

Log in and get user credentials.

<pre>
POST /users/authenticate
</pre>

Name | Type | | Description
-----|------|-|--------------
`email_or_username`| string | required | User's Polar username or email.  Case insensitive.
`password`| string | required |User's Polar password.

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

### <a name="voting"></a> Vote on a poll

Voting

### <a name="createpoll"></a> Create a poll

Creating a poll