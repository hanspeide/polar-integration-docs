## Polar API

About the API:

* the API was originally written to support our native iOS app and web client, not for third-party developers.  As such, there are a few items that could be cleaned up.  Furthermore, as our app evolves, the API may evolve as well
* Polar reserves the right to revoke developer accounts if the integration does not meet our standards
* integrated Polar content must include Polar branding

If you think using the API is for you, [contact us](http://polarb.com/contact).

**API: get the most recent polls in Polar**
<pre>
Request:
GET https://polarb.com/api/v4/polls
</pre>

Example response:

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