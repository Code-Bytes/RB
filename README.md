CodeByte API

`base_url: https://pacific-hamlet-4796.herokuapp.com/`

`POST '/auth/github'`

Returns a JWT token.

Required Params: 
* `code` => `string`, temporary code returned by callback URL
* `clientID` => `string`, known client ID of github App
* `redirectUri` => `string`, callback URL

Example Response:

```json
{
"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ1c2VyX2lkIjoxNn0.pGJXRN1Y32xO9ilKn-j7wdkK7CBUpCp49D7j-72Kokp1_bG09wphgTr0dimiJ8Fsqsut19SY3EYwMxkvGDqvZg"
}
```

After decoded:
```json
{
"user_id": "290330"
}
```