#CodeByte API

`base_url: https://pacific-hamlet-4796.herokuapp.com/`

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
"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ1c2VyX2lkIjoxNn0.pGJXRN1Y32xO9ilKn-j7wdkK7CBUpCp49D7j-72Kokp1_bG09wphgTr0dimiJ8Fsqsut19SY3EYwMxkvGDqvZg"
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
  "user": {
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
```

###Create a Post

`POST '/posts'`

Creates a post.  User must be authenticated.

Required Params: 

* `title` => `string`, title of the post

* `content` => `string`, content of post

Example response:

Status code:`200`

```json
{
  "id": 1,
  "title": "test",
  "content": "test",
  "user_id": 18,
  "created_at": "2015-07-10T00:50:43.473Z",
  "updated_at": "2015-07-10T00:50:43.473Z"
}
```

###Get all Posts

`GET '/posts'`

Returns all posts from all users.

No required params.

Example response:

Status code:`200`

```json
[
	{
	  "id": 1,
	  "title": "test",
	  "content": "test",
	  "user_id": 18,
	  "created_at": "2015-07-10T00:50:43.473Z",
	  "updated_at": "2015-07-10T00:50:43.473Z"
	},
	{
	  "id": 2,
	  "title": "test",
	  "content": "test",
	  "user_id": 18,
	  "created_at": "2015-07-10T00:50:43.473Z",
	  "updated_at": "2015-07-10T00:50:43.473Z"
	},
	{
	  "id": 3,
	  "title": "test",
	  "content": "test",
	  "user_id": 18,
	  "created_at": "2015-07-10T00:50:43.473Z",
	  "updated_at": "2015-07-10T00:50:43.473Z"
	}
]
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
  "id": 1,
  "title": "test",
  "content": "test",
  "user_id": 18,
  "created_at": "2015-07-10T00:50:43.473Z",
  "updated_at": "2015-07-10T00:50:43.473Z"
}
```

###Delete a Post

`DELETE '/posts/:id'`

Deletes a post.

No required params.

Example Response:

Status code:`200`

```json
{}
```






