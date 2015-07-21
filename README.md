#CodeByte API

`base_url: https://pacific-hamlet-4796.herokuapp.com/`

###Quick Find:

####Users

* [Authenticate User](#authenticate-user)
`POST '/auth/github'`
* [Get Authenticated User](#get-authenticated-user)
`GET '/me'`
* [List All Users](#list-all-users)
`GET '/users'`
* [Find User By Id](#find-user-by-id)
`GET /users/:id`
* [List a User's Posts](#list-a-users-posts)
`GET /users/:id/posts`

####Posts

* [Create a Post](#create-a-post)
`POST '/posts'`
* [Get all Posts](#get-all-posts)
`GET '/posts'`
* [Update a Post](update-a-post)
`PUT '/posts/:id'`
* [Delete a Post](#delete-a-post)
`DELETE '/posts/:id'`

####Voting

* [Add an Upvote](#add-an-upvote)
`PUT 'posts/:id/like'`
* [Add a Downvote](#add-a-downvote)
`PUT 'posts/:id/dislike'`

####Comment

* [Create a Comment](#create-a-comment)
`POST '/posts/:id/comments'`
* [Get Comments on a Post](#get-comments-on-a-post)
`GET '/posts/:id/comments'`
* [Reply to a Comment](#reply-to-a-comment)
`POST '/comments/:id/reply'`
* [Get a Comment](#get-a-comment)
`GET '/comments/:id'`
* [Update a Comment](#update-a-comment)
`PUT '/comments/:id'`
* [Delete a comment](#delete-a-comment)
`DELETE '/comments/:id'`

####Tags
* [Find all Tags](#find-all-tags)
`GET '/tags'`
* [Find a Tag](#find-a-tag)
`GET '/tags/:name'`

All authenticated requests are made by passing 'Authorization' in the request header.  That header will contain the JWT token returned after authentication.

###Authenticate User

`POST '/auth/github'`

Returns a JWT token.

Required Params: 

* `code` => `string`, temporary code returned by callback URL

* `clientId` => `string`, known client ID of github App

* `redirectUri` => `string`, callback URL

Example Response:

Status code:

```json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ1c2VyX2lkIjoxfQ.G3wwMUmERIptYGDLwm5vp4o7uOcSi8Qrd3evA5YMp_WEYQp1e5lp0WqNo-p6BW3bTNb5C2NXBZvP790jVNnaYw",
  "user": {
    "user_id": 1,
    "username": "taylor-d",
    "email": "mdaugherty6@gmail.com",
    "avatar": "https://avatars.githubusercontent.com/u/9401828?v=3",
    "company": "",
    "url": "https://api.github.com/users/taylor-d",
    "blog": "http://www.taylormath.com",
    "location": "Atlanta, GA",
    "follower_count": 13,
    "following_count": 17,
    "public_gists": 3,
    "hireable": true
  }
}
```

###Get Authenticated User

`GET '/me'`

Returns the user object for the authenticated user.

No required params. 

User must be authenticated.

Example response:

Status code:`200`

```json
{
  "user": {
    "id": 1,
    "email": "mdaugherty6@gmail.com",
    "username": "taylor-d",
    "github": "9401828",
    "created_at": "2015-07-14T16:20:46.964Z",
    "updated_at": "2015-07-14T16:20:46.985Z",
    "avatar": "https://avatars.githubusercontent.com/u/9401828?v=3",
    "company": "",
    "url": "https://api.github.com/users/taylor-d",
    "location": "Atlanta, GA",
    "follower_count": 13,
    "following_count": 17,
    "public_gists": 3,
    "hireable": true,
    "blog": "http://www.taylormath.com"
  }
}
```

###List all Users

`GET '/users'`

No required params.

Example Response:
```json
{
  "users": [
    {
      "id": 1,
      "email": "mdaugherty6@gmail.com",
      "password": "f36452412da0a8a1892403b5f16f5f4d",
      "username": "taylor-d",
      "github": "9401828",
      "created_at": "2015-07-14T16:20:46.964Z",
      "updated_at": "2015-07-14T16:20:46.985Z",
      "avatar": "https://avatars.githubusercontent.com/u/9401828?v=3",
      "company": "",
      "url": "https://api.github.com/users/taylor-d",
      "location": "Atlanta, GA",
      "follower_count": 13,
      "following_count": 17,
      "public_gists": 3,
      "hireable": true,
      "blog": "http://www.taylormath.com"
    }
  ]
}
```

###Find user by id

`GET '/users/:id'`

Required params:

* `id` => `string`, user id

Example Response:

```json
{
  "user": {
    "id": 1,
    "email": "mdaugherty6@gmail.com",
    "username": "taylor-d",
    "github": "9401828",
    "created_at": "2015-07-14T16:20:46.964Z",
    "updated_at": "2015-07-14T16:20:46.985Z",
    "avatar": "https://avatars.githubusercontent.com/u/9401828?v=3",
    "company": "",
    "url": "https://api.github.com/users/taylor-d",
    "location": "Atlanta, GA",
    "follower_count": 13,
    "following_count": 17,
    "public_gists": 3,
    "hireable": true,
    "blog": "http://www.taylormath.com"
  }
}
```

###List a user's posts

`GET '/users/:id/posts'`

Required params:

* `id` => `string`, user id


Example Response:

```json
{
  "users": [
    {
      "id": 2,
      "title": "first post",
      "content": "does this work?",
      "user_id": 1,
      "created_at": "2015-07-14T16:27:18.124Z",
      "updated_at": "2015-07-14T16:27:18.124Z",
      "cached_votes_total": 0,
      "cached_votes_up": 0,
      "cached_votes_down": 0,
      "cached_votes_score": 0,
      "user": {
        "id": 1,
        "username": "taylor-d",
        "avatar": "https://avatars.githubusercontent.com/u/9401828?v=3"
      }
    },
    {
      "id": 1,
      "title": "first post",
      "content": "does this work?",
      "user_id": 1,
      "created_at": "2015-07-14T16:26:41.841Z",
      "updated_at": "2015-07-14T16:26:41.841Z",
      "cached_votes_total": 0,
      "cached_votes_up": 0,
      "cached_votes_down": 0,
      "cached_votes_score": 0,
      "user": {
        "id": 1,
        "username": "taylor-d",
        "avatar": "https://avatars.githubusercontent.com/u/9401828?v=3"
      }
    }
  ]
}
```

###Create a Post

`POST '/posts'`

Creates a post.  User must be authenticated.

Required Params: 

* `title` => `string`, title of the post

* `content` => `string`, content of post

Optional Params:

* `tags` => `string`
  * tags must be comma seperated, contain no spaces between words.

* `gist_id` => `string`
  * attach the gist hash to a post.  

Example response:

Status code:`200`

```json
{
  "post": {
    "id": 3,
    "title": "this is another test",
    "content": "does this work?",
    "user_id": 1,
    "created_at": "2015-07-14T17:50:14.191Z",
    "updated_at": "2015-07-14T17:50:14.191Z",
    "cached_votes_total": 0,
    "cached_votes_up": 0,
    "cached_votes_down": 0,
    "cached_votes_score": 0,
    "user": {
      "id": 1,
      "username": "taylor-d",
      "avatar": "https://avatars.githubusercontent.com/u/9401828?v=3"
    }
  }
}
```

###Get all Posts

`GET '/posts'`

Returns all posts from all users.

No required params.

Optional params: 

* `sort` => `string`
  * `new` => most recently created posts
  * `top` => posts with most net votes

* `page` => `string`, content of post
  * paginates 15 posts for each page

* `tags` => `string`
  * tags must be comma seperated, contain no spaces between words.
  * will return any posts with a tag in the list given.  



Example response:

Status code:`200`

```json
{
  "posts": [
    {
      "id": 1,
      "title": "first post",
      "content": "does this work?",
      "user_id": 1,
      "created_at": "2015-07-14T16:26:41.841Z",
      "updated_at": "2015-07-14T16:26:41.841Z",
      "cached_votes_total": 0,
      "cached_votes_up": 0,
      "cached_votes_down": 0,
      "cached_votes_score": 0,
      "user": {
        "id": 1,
        "username": "taylor-d",
        "avatar": "https://avatars.githubusercontent.com/u/9401828?v=3"
      }
    },
    {
      "id": 2,
      "title": "first post",
      "content": "does this work?",
      "user_id": 1,
      "created_at": "2015-07-14T16:27:18.124Z",
      "updated_at": "2015-07-14T16:27:18.124Z",
      "cached_votes_total": 0,
      "cached_votes_up": 0,
      "cached_votes_down": 0,
      "cached_votes_score": 0,
      "user": {
        "id": 1,
        "username": "taylor-d",
        "avatar": "https://avatars.githubusercontent.com/u/9401828?v=3"
      }
    },
    {
      "id": 3,
      "title": "this is another test",
      "content": "does this work?",
      "user_id": 1,
      "created_at": "2015-07-14T17:50:14.191Z",
      "updated_at": "2015-07-14T17:50:14.191Z",
      "cached_votes_total": 0,
      "cached_votes_up": 0,
      "cached_votes_down": 0,
      "cached_votes_score": 0,
      "user": {
        "id": 1,
        "username": "taylor-d",
        "avatar": "https://avatars.githubusercontent.com/u/9401828?v=3"
      }
    }
  ]
}
```

###Update a Post

`PUT '/posts/:id'`

Updates a post

No required params.

Options params:

* `title` => `string`, title of the post

* `content` => `string`, content of post

Example Response: 

Status code:`200`

```json
{
  "post": {
    "id": 1,
    "title": "first post",
    "content": "does this work?",
    "user_id": 1,
    "created_at": "2015-07-14T16:26:41.841Z",
    "updated_at": "2015-07-14T16:26:41.841Z",
    "cached_votes_total": 0,
    "cached_votes_up": 0,
    "cached_votes_down": 0,
    "cached_votes_score": 0,
    "user": {
      "id": 1,
      "username": "taylor-d",
      "avatar": "https://avatars.githubusercontent.com/u/9401828?v=3"
    }
  }
}
```

###Delete a Post

`DELETE '/posts/:id'`

Deletes a post.

No required params.

Example Response:

Status code:`200`

```json
{
  "post": {
    "id": 1,
    "title": "first post",
    "content": "does this work?",
    "user_id": 1,
    "created_at": "2015-07-14T16:26:41.841Z",
    "updated_at": "2015-07-14T16:26:41.841Z",
    "cached_votes_total": 0,
    "cached_votes_up": 0,
    "cached_votes_down": 0,
    "cached_votes_score": 0,
    "user": {
      "id": 1,
      "username": "taylor-d",
      "avatar": "https://avatars.githubusercontent.com/u/9401828?v=3"
    }
  }
}
```

###Add an Upvote

`PUT 'posts/:id/like'`

Adds an upvote (agreement).

No required params.

Example Response:

Status code:`200`

```json
{
  "post": {
    "id": 1,
    "title": "first post",
    "content": "does this work?",
    "user_id": 1,
    "created_at": "2015-07-14T16:26:41.841Z",
    "updated_at": "2015-07-14T18:01:24.634Z",
    "cached_votes_total": 1,
    "cached_votes_up": 1,
    "cached_votes_down": 0,
    "cached_votes_score": 1,
    "user": {
      "id": 1,
      "username": "taylor-d",
      "avatar": "https://avatars.githubusercontent.com/u/9401828?v=3"
    }
  }
}
```

###Add a Downvote

`PUT 'posts/:id/dislike'`

Adds a downvote (disagreement).

No required params.

Example Response:

Status code:`200`

```json
{
  "post": {
    "id": 1,
    "title": "first post",
    "content": "does this work?",
    "user_id": 1,
    "created_at": "2015-07-14T16:26:41.841Z",
    "updated_at": "2015-07-14T18:01:24.634Z",
    "cached_votes_total": 1,
    "cached_votes_up": 0,
    "cached_votes_down": 1,
    "cached_votes_score": -1,
    "user": {
      "id": 1,
      "username": "taylor-d",
      "avatar": "https://avatars.githubusercontent.com/u/9401828?v=3"
    }
  }
}
```

###Create a Comment

`POST '/posts/:post_id/comments'`

Required Params: 

* `content` => `string`, content of comment

Example Response: 

```json

{
  "comment": {
    "id": 1,
    "content": "it sure does!",
    "parent_id": null,
    "user": {
      "id": 1,
      "username": "taylor-d",
      "avatar": "https://avatars.githubusercontent.com/u/9401828?v=3"
    },
    "post": {
      "id": 2,
      "content": "does this work?"
    }
  }
}

```

###Get Comments on a Post

`GET '/posts/:post_id/comments'`

No required comments.

Example Response:

```json
{
  "comments": [
    {
      "id": 1,
      "content": "it sure does!",
      "parent_id": null,
      "user": {
        "id": 1,
        "username": "taylor-d",
        "avatar": "https://avatars.githubusercontent.com/u/9401828?v=3"
      },
      "post": {
        "id": 2,
        "content": "does this work?"
      }
    },
    {
      "id": 2,
      "content": "im glad it works!",
      "parent_id": 1,
      "user": {
        "id": 1,
        "username": "taylor-d",
        "avatar": "https://avatars.githubusercontent.com/u/9401828?v=3"
      },
      "post": {
        "id": 2,
        "content": "does this work?"
      }
    }
  ]
}
```

###Reply to a Comment

`POST '/comments/:id/reply'`

Must be authenticated.

Required Params: 

* `content` => `string`, content of comment

Example Response:

```json
{
  "comment": {
    "id": 1,
    "content": "it sure does!",
    "parent_id": null,
    "user": {
      "id": 1,
      "username": "taylor-d",
      "avatar": "https://avatars.githubusercontent.com/u/9401828?v=3"
    },
    "post": {
      "id": 2,
      "content": "does this work?"
    }
  }
}
```

###Get a Comment

`GET 'comments/:id'`

Example Response:

```json
{
  "comment": {
    "id": 1,
    "content": "it sure does!",
    "parent_id": null,
    "user": {
      "id": 1,
      "username": "taylor-d",
      "avatar": "https://avatars.githubusercontent.com/u/9401828?v=3"
    },
    "post": {
      "id": 2,
      "content": "does this work?"
    }
  }
}
```

###Update a Comment

Must be authenticated.

Optional Params:

* `content` => `string`, content of comment

`PUT '/comments/:id'`

Example Response:

```json
{
  "comment": {
    "id": 1,
    "content": "it sure does!",
    "parent_id": null,
    "user": {
      "id": 1,
      "username": "taylor-d",
      "avatar": "https://avatars.githubusercontent.com/u/9401828?v=3"
    },
    "post": {
      "id": 2,
      "content": "does this work?"
    }
  }
}
```

###Delete a comment

Must be authenticated.

`DELETE '/comments/:id'`

Example Response:

```json
{}
```

###Find All Tags

`GET '/tags'`

Gets all tags.

No required params.

Example response:

```json
{
  "tags": [
    {
      "id": 1,
      "name": "javascript",
      "taggings_count": 0
    },
    {
      "id": 2,
      "name": "java",
      "taggings_count": 0
    },
    {
      "id": 3,
      "name": "c#",
      "taggings_count": 0
    },
    {
      "id": 4,
      "name": "c",
      "taggings_count": 0
    },
    {
      "id": 5,
      "name": "php",
      "taggings_count": 0
    },
    {
      "id": 6,
      "name": "android",
      "taggings_count": 0
    }...
  ]
}
```

###Find A Tag

`GET '/tags/:name'`

No required params.

Example response:

```json
{
  "text": "javascript",
}

```