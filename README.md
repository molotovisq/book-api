# Laravel Book API

Welcome to the my Book API documentation. This API allows managing a collection of books.

## Package and Version Information

**PHP**: 8.2.7

**Laravel**: 10

**Composer:** 2.5.8 

**MySQL**: 8.0.33



## Authentication

Authentication is required to access protected API resources. To authenticate your requests, you must log in, receive your access token and include it in the authorization header of future requests.

### Login - `GET` `/api/login`

| Parâmetro   | Tipo       | Descrição                           |
| :---------- | :--------- | :---------------------------------- |
| `name` | `string` | **Mandatory**. Username |
| `password` | `string` | **Mandatory**. Password |

#### Request - *Example*
```
POST /api/login HTTP/1.1
Host: localhost
Content-Type: application/json

{
    "name": "Teste",
    "password": "teste1123"
}
```

#### Response - *Success*

```
{
    "success": true,
    "data": {
        "token": "1|OlWyMhSHPYdun8NRNspdn3wbFpKWfUutLKCOYjkF",
        "name": "Teste"
    },
    "message": "User login successfully."
}
```

#### Response - *Error*
```
{
    "success": false,
    "message": "Unauthorized.",
    "data": {
        "error": "Unauthorized"
    }
}
```

### Logout - `POST` `/api/logout`

| Parâmetro   | Tipo       | Descrição                           |
| :---------- | :--------- | :---------------------------------- |
| `Authorization` | `string` | **Mandatory**. Your access token |


## Resources

### Authorization Header

```http
Authorization: Bearer <your_access_token>
```

Be sure to replace <your_access_token> with your valid authentication token.


### Get all books - `GET` `/api/books`

Returns all available books.

```http
GET /api/books HTTP/1.1
Host: localhost
Authorization: Bearer <your_access_token>
```

Parameters:

| Parâmetro   | Tipo       | Descrição                           |
| :---------- | :--------- | :---------------------------------- |
| `Authorization` | `string` | **Mandatory**. Your access token |

### Get a specific book - `GET` `/api/books/{id}`

Returns details for a specific book.

```http
GET /api/books/{id} HTTP/1.1
Host: localhost
Authorization: Bearer <your_access_token>
```
Parameters:

| Parameter   | Type       | Description                           |
| :---------- | :--------- | :---------------------------------- |
| `Authorization` | `string` | **Mandatory**. Your access token |
| `id`        | `integer`   |  **Mandatory**. The ID of the book to retrieve. |

### Add a new book - `POST` `/api/books`

Adds a new book. 

```http
POST /api/books HTTP/1.1
Host: localhost
Authorization: Bearer <your_access_token>
Content-Type: application/json

{
    "name": "Livro de Feitiços",
    "isbn": "9744535912342",
    "value": 230.53
}
```

Parameters:

| Parameter   | Type       | Description                           |
| :---------- | :--------- | :---------------------------------- |
| `Authorization` | `string` | **Mandatory**. Your access token |
| `name`      | `string`   | **Mandatory**. Book name.     |
| `isbn`      | `unsigned integer`   | **Mandatory**. Book isbn.     |
| `value`     | `double`   | **Mandatory**. Book value.    |

### Update a specific book - `PUT` `/api/books/{id}`

Updates a specific book. 

```http
POST /api/books/1 HTTP/1.1
Host: localhost
Authorization: Bearer <your_access_token>
Content-Type: application/json

{
    "name": "Livro de Magias",
    "isbn": "9744535912342",
    "value": 230.53
}
```

Parameters:

| Parameter   | Type       | Description                           |
| :---------- | :--------- | :---------------------------------- |
| `Authorization` | `string` | **Mandatory**. Your access token |
| `{id}`        | `integer`   |  **Mandatory**. The ID of the book to update. |
| `name`      | `string`   | **Mandatory**. Book name.     |
| `isbn`      | `unsigned integer`   | **Mandatory**. Book isbn.     |
| `value`     | `double`   | **Mandatory**. Book value.    |

### Delete a specific book - `DELETE` `/api/books/{id}`

Deletes a specific book. 

```http
DELETE /api/books/1 HTTP/1.1
Host: localhost
Authorization: Bearer <your_access_token>
Content-Type: application/json

```

Parameters:

| Parameter   | Type       | Description                           |
| :---------- | :--------- | :---------------------------------- |
| `Authorization` | `string` | **Mandatory**. Your access token |
| `{id}`        | `integer`   |  **Mandatory**. The ID of the book to delete. |


## Errors

The API returns the following status codes and error messages:

- 401 Unauthorized: The request was not authenticated or the access token is invalid.
- 404 Not Found: The requested resource was not found.
- 500 Internal Server Error: An internal server error occurred.



## Author

- José Marcolino - [@molotovisq](https://www.github.com/molotovisq)

