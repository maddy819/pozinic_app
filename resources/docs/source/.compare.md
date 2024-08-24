---
title: API Reference

language_tabs:
- bash
- javascript

includes:

search: true

toc_footers:
- <a href='http://github.com/mpociot/documentarian'>Documentation Powered by Documentarian</a>
---
<!-- START_INFO -->
# Info

Welcome to the generated API reference.
[Get Postman Collection](https://phpstack-250897-1931063.cloudwaysapps.com/docs/collection.json)

<!-- END_INFO -->

#Authorization


<!-- START_a925a8d22b3615f12fca79456d286859 -->
## APIs for user login

> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/auth/login" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"email":"example@domain.com","type":"social\/normal","password":"officiis"}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/auth/login"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "email": "example@domain.com",
    "type": "social\/normal",
    "password": "officiis"
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvcGhwc3RhY2stMjUwODk3LTE5MzEwNjMuY2xvdWR3YXlzYXBwcy5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2MjMwNjk4MjYsImV4cCI6MTYyMzA3MzQyNiwibmJmIjoxNjIzMDY5ODI2LCJqdGkiOiJYVTI3QmI4NzNKRG5jRDF2Iiwic3ViIjo3LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.42v5UZxaw-qDFj1zrRMqF01QbNPJzt0eD_gZpg9tsFo"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Invalid Email or Password..!!"
}
```
> Example response (400):

```json
{
    "success": false,
    "message": "Bad Request..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/auth/login`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `email` | string |  required  | The email of the user.
        `type` | string |  required  | The login type of the user.
        `password` | string |  optional  | The password of the user.
    
<!-- END_a925a8d22b3615f12fca79456d286859 -->

<!-- START_2e1c96dcffcfe7e0eb58d6408f1d619e -->
## APIs for user registration

> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/auth/register" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"name":"jhon doe","email":"example@domain.com","image":"praesentium","type":"social\/normal","password":"illo"}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/auth/register"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "name": "jhon doe",
    "email": "example@domain.com",
    "image": "praesentium",
    "type": "social\/normal",
    "password": "illo"
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvcGhwc3RhY2stMjUwODk3LTE5MzEwNjMuY2xvdWR3YXlzYXBwcy5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2MjMwNjk4MjYsImV4cCI6MTYyMzA3MzQyNiwibmJmIjoxNjIzMDY5ODI2LCJqdGkiOiJYVTI3QmI4NzNKRG5jRDF2Iiwic3ViIjo3LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.42v5UZxaw-qDFj1zrRMqF01QbNPJzt0eD_gZpg9tsFo"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Unable to register user..!!"
}
```
> Example response (400):

```json
{
    "success": false,
    "message": "Bad Request..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/auth/register`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `name` | string |  required  | The name of the user.
        `email` | string |  required  | The email of the user.
        `image` | blob |  optional  | the image of the user.
        `type` | string |  required  | The login type of the user.
        `password` | string |  optional  | The password of the user.
    
<!-- END_2e1c96dcffcfe7e0eb58d6408f1d619e -->

<!-- START_b4b084ba92611d2b93b101e3e03cac1b -->
## APIs for refreshing user token

> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/refresh/token" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/refresh/token"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "refreshToken": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvcGhwc3RhY2stMjUwODk3LTE5MzEwNjMuY2xvdWR3YXlzYXBwcy5jb21cL2FwaVwvdXNlclwvcmVmcmVzaFwvdG9rZW4iLCJpYXQiOjE2MjM4MzYxOTQsImV4cCI6MTYyMzg0MTgwNSwibmJmIjoxNjIzODM4MjA1LCJqdGkiOiJQUURDbGMxU01mbFhzdTFkIiwic3ViIjo2LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.Yf0zK9nAJFsTTQQtaztcYOJDqWp1h3HoTo6eqvXietg"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```

### HTTP Request
`GET api/user/refresh/token`


<!-- END_b4b084ba92611d2b93b101e3e03cac1b -->

<!-- START_9dac0740f5fcc2d88cf68ffbb1dd80d4 -->
## APIs for forgot password

> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/forgot/password" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"email":"example@domain.com"}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/forgot/password"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "email": "example@domain.com"
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "Password reset link sent to email..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "User not found..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```

### HTTP Request
`POST api/user/forgot/password`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `email` | string |  required  | The email of the user.
    
<!-- END_9dac0740f5fcc2d88cf68ffbb1dd80d4 -->

<!-- START_b655d0266f75fadab1fcfb9a5ae65675 -->
## APIs for logging out the user

> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/logout" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/logout"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "User has been logged out..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```

### HTTP Request
`GET api/user/logout`


<!-- END_b655d0266f75fadab1fcfb9a5ae65675 -->

#Blogs


<!-- START_8ce9b35821b279e8fe94fb52ad18a077 -->
## API for getting All blogs

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/blogs" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/blogs"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "blogs": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "What is Lorem Ipsum?",
                "slug": "what-is-lorem-ipsum",
                "type": "Nutrition",
                "url": "http:\/\/www.londatiga.net\/it\/programming\/programming-programming-it\/how-to-set-time-zone-on-php-and-mysql\/",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/blogs\/1625928176.png",
                "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
                "tags": "exercise,health,nutrition",
                "visible": 1,
                "created_at": "2021-05-13 06:56:08",
                "updated_at": "2021-06-07 12:07:28"
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/blogs?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/blogs?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/blogs",
        "per_page": 15,
        "prev_page_url": null,
        "to": 1,
        "total": 1
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Blogs Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/blogs`


<!-- END_8ce9b35821b279e8fe94fb52ad18a077 -->

<!-- START_96616c9f5e52ee9fb0c4c2ddafa4c556 -->
## APIs for saving blogs

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/blogs" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"title":"et","type":"et","image":"rerum","description":"ut","tags":"eos","visible":1}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/blogs"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "title": "et",
    "type": "et",
    "image": "rerum",
    "description": "ut",
    "tags": "eos",
    "visible": 1
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "Blog posted successfully..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Unable to post blog..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/blogs`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `title` | string |  required  | The title of the blog.
        `type` | string |  required  | The type of the blog.
        `image` | blob |  optional  | The image of the blog.
        `description` | longtext |  required  | The description of the blog.
        `tags` | string |  optional  | The tags of the blog.
        `visible` | integer |  required  | The visibility of the blog.
    
<!-- END_96616c9f5e52ee9fb0c4c2ddafa4c556 -->

#Contacts


<!-- START_e1625404aaf762aa591c10b259222b07 -->
## APIs for saving contacts

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/contacts" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"name":"qui","email":"quae","subject":"officia","description":"cum"}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/contacts"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "name": "qui",
    "email": "quae",
    "subject": "officia",
    "description": "cum"
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "Contact posted successfully..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Unable to post contact..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/contacts`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `name` | string |  required  | The name of the contact.
        `email` | string |  required  | The email of the contact.
        `subject` | string |  required  | The subject of the contact.
        `description` | longtext |  required  | The description of the contact.
    
<!-- END_e1625404aaf762aa591c10b259222b07 -->

#Equipments


<!-- START_ba5b04ff2f48b1c557061f5c6e987753 -->
## api/equipments/all
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/equipments/all" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/equipments/all"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "equipments": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "name": "Full Body Blaster",
                "slug": "full-body-blaster",
                "weight": "500",
                "description": "<p>fadsfadfda<\/p>",
                "created_at": "2021-05-13 06:56:08",
                "updated_at": "2021-06-07 12:07:28"
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/equipments\/all?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/equipments\/all?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/equipments\/all",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Exercise Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/equipments/all`


<!-- END_ba5b04ff2f48b1c557061f5c6e987753 -->

#Exercise


<!-- START_d4aaf1da0d222b16edc9fa0ddf35b2bd -->
## api/user/favourite/exercises
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/favourite/exercises" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/favourite/exercises"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "exercises": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "based_on": "reps",
                "duration": "10:30",
                "reps": 5,
                "focus_area": "Full Body",
                "specific_muscles": "Core, Shoulders",
                "good_for": "vdzvz",
                "type": "warmup,exercise",
                "level": "Advanced",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/exercises\/images\/1623067648.jpg"
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/user\/favourite\/exercises?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/user\/favourite\/exercises?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/user\/favourite\/exercises",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Exercise Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/user/favourite/exercises`


<!-- END_d4aaf1da0d222b16edc9fa0ddf35b2bd -->

<!-- START_6be731d73df7ea1f050a4d511e5176de -->
## api/user/recent/exercises
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/recent/exercises" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/recent/exercises"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "exercises": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "based_on": "reps",
                "duration": "10:30",
                "reps": 5,
                "focus_area": "Full Body",
                "specific_muscles": "Core, Shoulders",
                "good_for": "vdzvz",
                "type": "warmup,exercise",
                "level": "Advanced",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/exercises\/images\/1623067648.jpg"
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/user\/recent\/exercises?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/user\/recent\/exercises?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/user\/recent\/exercises",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Exercise Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/user/recent/exercises`


<!-- END_6be731d73df7ea1f050a4d511e5176de -->

<!-- START_12ea5c7bea37c7faa11a89f347117f78 -->
## api/exercise/featured/category
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/exercise/featured/category" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/exercise/featured/category"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "data": [
        {
            "categoryId": "4",
            "categoryName": "Misc Fee",
            "exercises": [
                {
                    "id": 1,
                    "title": "Full Body Blaster",
                    "based_on": "reps",
                    "duration": "10:30",
                    "reps": 5,
                    "focus_area": [
                        "Full Body"
                    ],
                    "specific_muscles": [
                        "Core",
                        "Shoulders"
                    ],
                    "good_for": [
                        "vdzvz"
                    ],
                    "type": [
                        "warmup",
                        "exercise"
                    ],
                    "level": "Advanced",
                    "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/exercises\/images\/1625552652.png"
                }
            ]
        }
    ]
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "User Not Found..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Category not found..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Exercises not found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/exercise/featured/category`


<!-- END_12ea5c7bea37c7faa11a89f347117f78 -->

<!-- START_15d516145e5c60dd44dab1f1b2ae9dec -->
## api/exercise/all
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/exercise/all" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/exercise/all"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "exercises": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "based_on": "reps",
                "duration": "10:30",
                "reps": 5,
                "focus_area": "Full Body",
                "specific_muscles": "Core, Shoulders",
                "good_for": "vdzvz",
                "type": "warmup,exercise",
                "level": "Advanced",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/exercises\/images\/1623067648.jpg"
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/exercise\/all?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/exercise\/all?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/exercise\/all",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Exercise Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/exercise/all`


<!-- END_15d516145e5c60dd44dab1f1b2ae9dec -->

<!-- START_7c4eabfeb8a34c8597abd5277b9fc2ca -->
## api/exercise/single/{id}
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/exercise/single/voluptatum" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/exercise/single/voluptatum"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "exercise": {
        "id": 1,
        "title": "Full Body Blaster",
        "code": "FBB21",
        "slug": "full-body-blaster",
        "category_id": 2,
        "duration": "10:30",
        "instructions": "fvadfadfa",
        "description": "fadsfadfda",
        "video_link": "https:\/\/docs.google.com\/spreadsheets\/d\/1pL55jhFOqmZrCguW79clLSf6IJYHeCPyP7VVEFIXNRM\/edit#gid=0",
        "tip_video": "https:\/\/docs.google.com\/spreadsheets\/d\/1pL55jhFOqmZrCguW79clLSf6IJYHeCPyP7VVEFIXNRM\/edit#gid=0",
        "tip_video_thumbnail": "https:\/\/i.ytimg.com\/vi\/AGnRVWiDHco\/hqdefault.jpg",
        "reps": "5",
        "focus_area": "Full Body",
        "specific_muscles": "Core, Shoulders",
        "good_for": "vdzvz",
        "type": "warmup,exercise",
        "Notes": null,
        "level": "Advanced",
        "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/exercises\/images\/1623067648.jpg",
        "tags": "exercise,health,nutrition",
        "created_at": "2021-05-13 06:56:08",
        "updated_at": "2021-06-07 12:07:28"
    }
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Exercise Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/exercise/single/{id}`

#### URL Parameters

Parameter | Status | Description
--------- | ------- | ------- | -------
    `id` |  required  | The ID of the exercise.

<!-- END_7c4eabfeb8a34c8597abd5277b9fc2ca -->

#Faq


<!-- START_b8171a4fd016c86f64f8106d911dabd2 -->
## API for getting All faq&#039;s

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/faqs" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/faqs"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "faqs": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "question": "What is Lorem Ipsum?",
                "answer": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
                "created_at": "2021-05-13 06:56:08",
                "updated_at": "2021-06-07 12:07:28"
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/faqs?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/faqs?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/faqs",
        "per_page": 15,
        "prev_page_url": null,
        "to": 1,
        "total": 1
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Faqs Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/faqs`


<!-- END_b8171a4fd016c86f64f8106d911dabd2 -->

#Featured


<!-- START_3867cee459fb180d3be153eefeebee74 -->
## api/featured/resources
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/featured/resources" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/featured/resources"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "exercises": {},
    "workouts": {},
    "programs": {},
    "splits": {}
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/featured/resources`


<!-- END_3867cee459fb180d3be153eefeebee74 -->

#Filters


<!-- START_ca769fa2277711926394052fc7e7828d -->
## API for getting All exercise filters

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/exercise" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/exercise"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "filters": {
        "Level": [
            {
                "id": "Beginner",
                "name": "Beginner"
            },
            {
                "id": "Intermediate",
                "name": "Intermediate"
            },
            {
                "id": "Advanced",
                "name": "Advanced"
            }
        ],
        "Focus Area": [
            {
                "id": "brain",
                "name": "Brain"
            },
            {
                "id": "legs",
                "name": "Legs"
            },
            {
                "id": "hips",
                "name": "Hips"
            }
        ],
        "Good For": [
            {
                "id": "stomach",
                "name": "Stomach"
            },
            {
                "id": "legs",
                "name": "Legs"
            }
        ],
        "Muscles": [
            {
                "id": "lower-back",
                "name": "Lower Back"
            },
            {
                "id": "upper-back",
                "name": "Upper Back"
            }
        ],
        "duration": [
            {
                "id": 5,
                "name": 5
            },
            {
                "id": 10,
                "name": 10
            }
        ]
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Filters Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/filter/exercise`


<!-- END_ca769fa2277711926394052fc7e7828d -->

<!-- START_5fbc9af601d3677935355f567542968e -->
## API for Filtering All exercises

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/exercise" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"title":"maiores","duration":[],"focus_area":[],"specific_muscles":[],"good_for":[],"type":[],"level":[],"equipment":[]}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/exercise"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "title": "maiores",
    "duration": [],
    "focus_area": [],
    "specific_muscles": [],
    "good_for": [],
    "type": [],
    "level": [],
    "equipment": []
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "exercises": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "based_on": "reps",
                "duration": "10:30",
                "reps": 5,
                "focus_area": "Full Body",
                "specific_muscles": "Core, Shoulders",
                "good_for": "vdzvz",
                "type": "warmup,exercise",
                "level": "Advanced",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/exercises\/images\/1623067648.jpg"
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/filter\/exercise?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/filter\/exercise?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/filter\/exercise",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Exercise Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/filter/exercise`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `title` | string |  optional  | The title of the exercise.
        `duration` | array |  optional  | The duration min limit of the exercise.
        `focus_area` | array |  optional  | The focus area of the exercise.
        `specific_muscles` | array |  optional  | The specific muscles of the exercise.
        `good_for` | array |  optional  | The good for of the exercise.
        `type` | array |  optional  | The type of the exercise.
        `level` | array |  optional  | The level of the exercise.
        `equipment` | array |  optional  | The equipments of the exercise.
    
<!-- END_5fbc9af601d3677935355f567542968e -->

<!-- START_591df8f1298c644666c1f864779053d9 -->
## API for getting All workout filters

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/workout" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/workout"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "filters": {
        "Level": [
            {
                "id": "Beginner",
                "name": "Beginner"
            },
            {
                "id": "Intermediate",
                "name": "Intermediate"
            },
            {
                "id": "Advanced",
                "name": "Advanced"
            }
        ],
        "Focus Area": [
            {
                "id": "brain",
                "name": "Brain"
            },
            {
                "id": "legs",
                "name": "Legs"
            },
            {
                "id": "hips",
                "name": "Hips"
            }
        ],
        "Good For": [
            {
                "id": "stomach",
                "name": "Stomach"
            },
            {
                "id": "legs",
                "name": "Legs"
            }
        ],
        "Equipments": [
            {
                "id": "1",
                "name": "Lower Back"
            },
            {
                "id": "2",
                "name": "Upper Back"
            }
        ],
        "duration": [
            {
                "id": 5,
                "name": 5
            },
            {
                "id": 10,
                "name": 10
            }
        ]
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Filters Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/filter/workout`


<!-- END_591df8f1298c644666c1f864779053d9 -->

<!-- START_701cf7a71323c32c22e2cb66a1a4b78a -->
## API for Filtering All workouts

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/workout" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"title":"accusamus","duration":[],"focus_area":[],"good_for":[],"level":[],"equipment":[]}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/workout"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "title": "accusamus",
    "duration": [],
    "focus_area": [],
    "good_for": [],
    "level": [],
    "equipment": []
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "workouts": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "duration": "10:30",
                "focus_area": "Full Body",
                "level": "Advanced",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/workouts\/images\/1623067648.jpg",
                "good_for": "vdzvz",
                "calories_burned": 56
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/filter\/workout?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/filter\/workout?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/filter\/workout",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Exercise Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/filter/workout`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `title` | string |  optional  | The title of the exercise.
        `duration` | array |  optional  | The duration min limit of the exercise.
        `focus_area` | array |  optional  | The focus area of the exercise.
        `good_for` | array |  optional  | The good for of the exercise.
        `level` | array |  optional  | The level of the exercise.
        `equipment` | array |  optional  | The equipments of the exercise.
    
<!-- END_701cf7a71323c32c22e2cb66a1a4b78a -->

<!-- START_eee7ab993bb27f977b3615a7179f4faf -->
## API for getting All split filters

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/split" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/split"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "filters": {
        "Level": [
            {
                "id": "Beginner",
                "name": "Beginner"
            },
            {
                "id": "Intermediate",
                "name": "Intermediate"
            },
            {
                "id": "Advanced",
                "name": "Advanced"
            }
        ],
        "Focus Area": [
            {
                "id": "brain",
                "name": "Brain"
            },
            {
                "id": "legs",
                "name": "Legs"
            },
            {
                "id": "hips",
                "name": "Hips"
            }
        ],
        "Good For": [
            {
                "id": "stomach",
                "name": "Stomach"
            },
            {
                "id": "legs",
                "name": "Legs"
            }
        ],
        "Equipments": [
            {
                "id": "1",
                "name": "Lower Back"
            },
            {
                "id": "2",
                "name": "Upper Back"
            }
        ],
        "duration": [
            {
                "id": 5,
                "name": 5
            },
            {
                "id": 10,
                "name": 10
            }
        ]
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Filters Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/filter/split`


<!-- END_eee7ab993bb27f977b3615a7179f4faf -->

<!-- START_24d0bdedc633c9acf95009c482c7a3a4 -->
## API for Filtering All split

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/split" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"title":"sit","duration":[],"focus_area":[],"good_for":[],"level":[],"equipment":[]}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/split"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "title": "sit",
    "duration": [],
    "focus_area": [],
    "good_for": [],
    "level": [],
    "equipment": []
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "programs": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "good_for": "vdzvz",
                "type": "warmup,exercise",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/splits\/images\/1623067648.jpg",
                "focus_area": "Full Body",
                "duration": "10:30",
                "level": "Advanced",
                "frequency": 45,
                "length": 5
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/filter\/split?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/filter\/split?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/filter\/split",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Exercise Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/filter/split`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `title` | string |  optional  | The title of the exercise.
        `duration` | array |  optional  | The duration min limit of the exercise.
        `focus_area` | array |  optional  | The focus area of the exercise.
        `good_for` | array |  optional  | The good for of the exercise.
        `level` | array |  optional  | The level of the exercise.
        `equipment` | array |  optional  | The equipments of the exercise.
    
<!-- END_24d0bdedc633c9acf95009c482c7a3a4 -->

<!-- START_db177f62fda6ab1459f3e4b18036f5df -->
## API for getting All program filters

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/program" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/program"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "filters": {
        "Level": [
            {
                "id": "Beginner",
                "name": "Beginner"
            },
            {
                "id": "Intermediate",
                "name": "Intermediate"
            },
            {
                "id": "Advanced",
                "name": "Advanced"
            }
        ],
        "Focus Area": [
            {
                "id": "brain",
                "name": "Brain"
            },
            {
                "id": "legs",
                "name": "Legs"
            },
            {
                "id": "hips",
                "name": "Hips"
            }
        ],
        "Good For": [
            {
                "id": "stomach",
                "name": "Stomach"
            },
            {
                "id": "legs",
                "name": "Legs"
            }
        ],
        "Equipments": [
            {
                "id": "1",
                "name": "Lower Back"
            },
            {
                "id": "2",
                "name": "Upper Back"
            }
        ],
        "duration": [
            {
                "id": 5,
                "name": 5
            },
            {
                "id": 10,
                "name": 10
            }
        ]
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Filters Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/filter/program`


<!-- END_db177f62fda6ab1459f3e4b18036f5df -->

<!-- START_aebd81124fa6cb969e9982ca47996dea -->
## API for Filtering All programs

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/program" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"title":"suscipit","duration":[],"focus_area":[],"good_for":[],"level":[],"equipment":[]}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/program"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "title": "suscipit",
    "duration": [],
    "focus_area": [],
    "good_for": [],
    "level": [],
    "equipment": []
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "programs": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "good_for": "vdzvz",
                "no_of_days": 90,
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/programs\/images\/1623067648.jpg",
                "focus_area": "Full Body",
                "duration": "10:30",
                "level": "Advanced",
                "frequency": 45,
                "length": 5
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/filter\/program?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/filter\/program?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/filter\/program",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Exercise Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/filter/program`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `title` | string |  optional  | The title of the exercise.
        `duration` | array |  optional  | The duration min limit of the exercise.
        `focus_area` | array |  optional  | The focus area of the exercise.
        `good_for` | array |  optional  | The good for of the exercise.
        `level` | array |  optional  | The level of the exercise.
        `equipment` | array |  optional  | The equipments of the exercise.
    
<!-- END_aebd81124fa6cb969e9982ca47996dea -->

<!-- START_d8b8d7f6e40e69b6746a995eee2c4520 -->
## API for getting All strech filters

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/strech" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/strech"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "filters": {
        "Level": [
            {
                "id": "Beginner",
                "name": "Beginner"
            },
            {
                "id": "Intermediate",
                "name": "Intermediate"
            },
            {
                "id": "Advanced",
                "name": "Advanced"
            }
        ],
        "Focus Area": [
            {
                "id": "brain",
                "name": "Brain"
            },
            {
                "id": "legs",
                "name": "Legs"
            },
            {
                "id": "hips",
                "name": "Hips"
            }
        ],
        "Good For": [
            {
                "id": "stomach",
                "name": "Stomach"
            },
            {
                "id": "legs",
                "name": "Legs"
            }
        ],
        "Muscles": [
            {
                "id": "lower-back",
                "name": "Lower Back"
            },
            {
                "id": "upper-back",
                "name": "Upper Back"
            }
        ],
        "duration": [
            {
                "id": 5,
                "name": 5
            },
            {
                "id": 10,
                "name": 10
            }
        ]
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Filters Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/filter/strech`


<!-- END_d8b8d7f6e40e69b6746a995eee2c4520 -->

<!-- START_e2463c592565934653d48271cdc189e1 -->
## API for Filtering All streches

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/strech" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"title":"non","duration":[],"focus_area":[],"specific_muscles":[],"good_for":[],"type":[],"level":[],"equipment":[]}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/strech"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "title": "non",
    "duration": [],
    "focus_area": [],
    "specific_muscles": [],
    "good_for": [],
    "type": [],
    "level": [],
    "equipment": []
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "streches": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "based_on": "reps",
                "duration": "10:30",
                "reps": 5,
                "focus_area": "Full Body",
                "specific_muscles": "Core, Shoulders",
                "good_for": "vdzvz",
                "type": "warmup,exercise",
                "level": "Advanced",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/streches\/images\/1623067648.jpg"
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/filter\/strech?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/filter\/strech?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/filter\/strech",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Strech Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/filter/strech`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `title` | string |  optional  | The title of the exercise.
        `duration` | array |  optional  | The duration min limit of the exercise.
        `focus_area` | array |  optional  | The focus area of the exercise.
        `specific_muscles` | array |  optional  | The specific muscles of the exercise.
        `good_for` | array |  optional  | The good for of the exercise.
        `type` | array |  optional  | The type of the exercise.
        `level` | array |  optional  | The level of the exercise.
        `equipment` | array |  optional  | The equipments of the exercise.
    
<!-- END_e2463c592565934653d48271cdc189e1 -->

<!-- START_cc29b8917b97aa4742f591d201f7c7ed -->
## api/filter/nutrition
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/nutrition" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"calorie":12}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/filter/nutrition"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "calorie": 12
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "nutrition": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "grfsgrfsg",
                "slug": "grfsgrfsg",
                "calorie_range_1": "1100",
                "calorie_range_2": "1350",
                "benefits": "Full Body",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/streches\/images\/1623067648.jpg",
                "instructions": "fvadfadfa",
                "description": "fadsfadfda"
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/filter\/nutrition?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/filter\/nutrition?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/filter\/nutrition",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Strech Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/filter/nutrition`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `calorie` | integer |  required  | The calorie for the nutrition.
    
<!-- END_cc29b8917b97aa4742f591d201f7c7ed -->

#Nutritions


<!-- START_6778ee7a3372908623e846e824f1ff7c -->
## API for getting All nutritions

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/nutritions" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/nutritions"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "nutritions": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "code": "POZNUT1",
                "title": "Sample Eating Plan, Western Vegan",
                "slug": "sample-eating-plan-western-vegan",
                "calorie_range_1": 1100,
                "calorie_range_2": 1350,
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/nutrition\/1625928176.png",
                "instructions": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
                "created_at": "2021-05-13 06:56:08",
                "updated_at": "2021-06-07 12:07:28"
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/nutritions?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/nutritions?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/nutritions",
        "per_page": 15,
        "prev_page_url": null,
        "to": 1,
        "total": 1
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Nutritions Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/nutritions`


<!-- END_6778ee7a3372908623e846e824f1ff7c -->

<!-- START_04f0ee48db3d55582960f56e97cadb90 -->
## api/nutritions/single/{id}
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/nutritions/single/numquam" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/nutritions/single/numquam"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "nutrition": {
        "id": 1,
        "code": "POZNUT1",
        "title": "Sample Eating Plan, Western Vegan",
        "slug": "sample-eating-plan-western-vegan",
        "calorie_range_1": 1100,
        "calorie_range_2": 1350,
        "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/nutrition\/1625928176.png",
        "instructions": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        "created_at": "2021-05-13 06:56:08",
        "updated_at": "2021-06-07 12:07:28"
    }
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Nutrition Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/nutritions/single/{id}`

#### URL Parameters

Parameter | Status | Description
--------- | ------- | ------- | -------
    `id` |  required  | The ID of the nutrition.

<!-- END_04f0ee48db3d55582960f56e97cadb90 -->

#Program


<!-- START_20bc85c96f34a3c66444dbf2d7bd27ff -->
## api/user/favourite/programs
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/favourite/programs" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/favourite/programs"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "programs": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "good_for": "vdzvz",
                "no_of_days": 90,
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/programs\/images\/1623067648.jpg",
                "focus_area": "Full Body",
                "duration": "10:30",
                "level": "Advanced",
                "frequency": 45
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/favourite\/programs?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/favourite\/programs?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/favourite\/programs",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "programs Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/user/favourite/programs`


<!-- END_20bc85c96f34a3c66444dbf2d7bd27ff -->

<!-- START_2ca81d5d7c2d6eb737a0f0e1734b09bd -->
## API for getting recent programs

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/recent/programs" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/recent/programs"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "programs": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "good_for": "vdzvz",
                "no_of_days": 90,
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/programs\/images\/1623067648.jpg",
                "focus_area": "Full Body",
                "duration": "10:30",
                "level": "Advanced",
                "frequency": 45
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/recent\/programs?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/recent\/programs?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/recent\/programs",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "programs Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/user/recent/programs`


<!-- END_2ca81d5d7c2d6eb737a0f0e1734b09bd -->

<!-- START_ba336e8ebbdca779d3ed8ecd3f244121 -->
## api/programs/all
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/programs/all" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/programs/all"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "programs": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "good_for": "vdzvz",
                "no_of_days": 90,
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/programs\/images\/1623067648.jpg",
                "focus_area": "Full Body",
                "duration": "10:30",
                "level": "Advanced",
                "frequency": 45
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/programs\/all?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/programs\/all?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/programs\/all",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "programs Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/programs/all`


<!-- END_ba336e8ebbdca779d3ed8ecd3f244121 -->

<!-- START_877ebdeffc8a58746e7f020591b25b6a -->
## api/programs/single/{id}
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/programs/single/pariatur" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/programs/single/pariatur"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "programs": {
        "id": 1,
        "code": "FBB21",
        "title": "Full Body Blaster",
        "slug": "full-body-blaster",
        "good_for": "vdzvz",
        "type": "warmup,exercise",
        "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/programs\/images\/1623067648.jpg",
        "focus_area": "Full Body",
        "duration": "10:30",
        "video_link": "https:\/\/docs.google.com\/spreadsheets\/d\/1pL55jhFOqmZrCguW79clLSf6IJYHeCPyP7VVEFIXNRM\/edit#gid=0",
        "level": "Advanced",
        "frequency": "45",
        "splits": "578",
        "description": "fadsfadfda",
        "instructions": "fvadfadfa",
        "tags": "exercise,health,nutrition",
        "visible": 1,
        "warm_ups": null,
        "created_at": "2021-05-13 06:56:08",
        "updated_at": "2021-06-07 12:07:28"
    }
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "programs Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/programs/single/{id}`

#### URL Parameters

Parameter | Status | Description
--------- | ------- | ------- | -------
    `id` |  required  | The ID of the program.
    `duration` |  required  | the duration of the program.

<!-- END_877ebdeffc8a58746e7f020591b25b6a -->

<!-- START_77e5d1e46787da62a64b0c1f0ca2f2d3 -->
## API for getting single program duration

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/programs/duration/incidunt" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/programs/duration/incidunt"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "workout": [
        5,
        10
    ]
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Workout Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/programs/duration/{id}`

#### URL Parameters

Parameter | Status | Description
--------- | ------- | ------- | -------
    `id` |  required  | The ID of the program.

<!-- END_77e5d1e46787da62a64b0c1f0ca2f2d3 -->

<!-- START_17cb742ca48d65fba275a0ffe6a5e638 -->
## api/programs/workouts/day/{id}/{day}/{duration}
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/programs/workouts/day/facilis/at/adipisci" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/programs/workouts/day/facilis/at/adipisci"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "workout": {
        "id": 1,
        "code": "FBB21",
        "title": "Full Body Blaster",
        "slug": "full-body-blaster",
        "duration": "10:30",
        "instructions": "fvadfadfa",
        "description": "fadsfadfda",
        "type": "warmup,exercise",
        "warm_ups": null,
        "post_streches": null,
        "focus_area": "Full Body",
        "level": "Advanced",
        "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/workouts\/images\/1623067648.jpg",
        "good_for": "vdzvz",
        "calories_burned": 56,
        "video_link": "https:\/\/docs.google.com\/spreadsheets\/d\/1pL55jhFOqmZrCguW79clLSf6IJYHeCPyP7VVEFIXNRM\/edit#gid=0",
        "tags": "exercise,health,nutrition",
        "visible": 1,
        "created_at": "2021-05-13 06:56:08",
        "updated_at": "2021-06-07 12:07:28"
    }
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "programs Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/programs/workouts/day/{id}/{day}/{duration}`

#### URL Parameters

Parameter | Status | Description
--------- | ------- | ------- | -------
    `id` |  required  | The ID of the program.
    `day` |  required  | The day of the program.
    `duration` |  required  | The duration of the program.

<!-- END_17cb742ca48d65fba275a0ffe6a5e638 -->

#Settings


<!-- START_10633908636252dc838d3a5bd392f07c -->
## APIs for getting app settings

> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/settings" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/settings"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "setting": {
        "id": 1,
        "title": "Poznic App",
        "email": "vickya819@gmail.com",
        "logo": "1626201264.jpg",
        "favicon": "1625904857.png",
        "contact": 9713879633,
        "website": "http:\/\/www.poznic.com",
        "description": "Poznic App",
        "tags": "Poznic App, Fitness, Exercise, workout",
        "address": "Sneh Nagar, Bhopal",
        "privacy_policy": "<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">What is Lorem Ipsum?<\/h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum<\/strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\/p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">Where does it come from?<\/h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<\/p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.<\/p>",
        "terms_condition": "<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">Why do we use it?<\/h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\/p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">Where can I get some?<\/h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.<\/p>",
        "created_at": "2021-05-13 04:42:43",
        "updated_at": "2021-08-17 15:55:33"
    },
    "success": true
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Settings not found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/settings`


<!-- END_10633908636252dc838d3a5bd392f07c -->

#Signup Questions


<!-- START_27fd458ed2d23a5aa2ef3455612d3d3b -->
## api/signup/questions
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/signup/questions" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/signup/questions"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "data": [
        {
            "id": 1,
            "question": "Endurance",
            "answers": [
                "A person's ability to exercise continuously for extended periods without having to use the restroom",
                "A person's ability to exercise continuously for extended periods without being hungry",
                "A person's ability to exercise continuously for extended periods without needing to think",
                "A person's ability to exercise continuously for extended periods without tiring"
            ]
        }
    ]
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "User Not Found..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Questions not found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/signup/questions`


<!-- END_27fd458ed2d23a5aa2ef3455612d3d3b -->

#Splits


<!-- START_d7393f62950fbc127cf66ad835ba4324 -->
## api/user/favourite/splits
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/favourite/splits" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/favourite/splits"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "splits": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "good_for": "vdzvz",
                "type": "warmup,exercise",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/splits\/images\/1623067648.jpg",
                "focus_area": "Full Body",
                "duration": "10:30",
                "level": "Advanced",
                "frequency": 45,
                "length": 5
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/favourite\/splits?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/favourite\/splits?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/favourite\/splits",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Splits Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/user/favourite/splits`


<!-- END_d7393f62950fbc127cf66ad835ba4324 -->

<!-- START_90de8d6e1486b9110636fa0f371bb888 -->
## api/user/recent/splits
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/recent/splits" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/recent/splits"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "splits": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "good_for": "vdzvz",
                "type": "warmup,exercise",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/splits\/images\/1623067648.jpg",
                "focus_area": "Full Body",
                "duration": "10:30",
                "level": "Advanced",
                "frequency": 45,
                "length": 5
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/recent\/splits?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/recent\/splits?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/recent\/splits",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Splits Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/user/recent/splits`


<!-- END_90de8d6e1486b9110636fa0f371bb888 -->

<!-- START_6714b9c71964c558f0744a9d59ec83fd -->
## api/splits/all
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/splits/all" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/splits/all"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "splits": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "good_for": "vdzvz",
                "type": "warmup,exercise",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/splits\/images\/1623067648.jpg",
                "focus_area": "Full Body",
                "duration": "10:30",
                "level": "Advanced",
                "frequency": 45,
                "length": 5
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/splits\/all?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/splits\/all?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/splits\/all",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "splits Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/splits/all`


<!-- END_6714b9c71964c558f0744a9d59ec83fd -->

<!-- START_1977f377b029d725415be8796af76fc4 -->
## api/splits/single/{id}
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/splits/single/odit" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/splits/single/odit"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "split": {
        "id": 1,
        "code": "FBB21",
        "title": "Full Body Blaster",
        "slug": "full-body-blaster",
        "good_for": "vdzvz",
        "type": "warmup,exercise",
        "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/splits\/images\/1623067648.jpg",
        "focus_area": "Full Body",
        "duration": "10:30",
        "video_link": "https:\/\/docs.google.com\/spreadsheets\/d\/1pL55jhFOqmZrCguW79clLSf6IJYHeCPyP7VVEFIXNRM\/edit#gid=0",
        "level": "Advanced",
        "frequency": "45",
        "length": "5",
        "splits": "578",
        "description": "fadsfadfda",
        "instructions": "fvadfadfa",
        "tags": "exercise,health,nutrition",
        "visible": 1,
        "warm_ups": null,
        "created_at": "2021-05-13 06:56:08",
        "updated_at": "2021-06-07 12:07:28"
    }
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "split Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/splits/single/{id}`

#### URL Parameters

Parameter | Status | Description
--------- | ------- | ------- | -------
    `id` |  required  | The ID of the split.
    `duration` |  required  | the duration of the split.

<!-- END_1977f377b029d725415be8796af76fc4 -->

<!-- START_360a8e5a73eb8ac9f37a7dee45931b8b -->
## API for getting single split duration

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/splits/duration/asperiores" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/splits/duration/asperiores"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "workout": [
        5,
        10
    ]
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Workout Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/splits/duration/{id}`

#### URL Parameters

Parameter | Status | Description
--------- | ------- | ------- | -------
    `id` |  required  | The ID of the split.

<!-- END_360a8e5a73eb8ac9f37a7dee45931b8b -->

<!-- START_d8d302c7da47cccf34d622654a10c51e -->
## api/splits/workouts/day/{id}/{day}/{duration}
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/splits/workouts/day/libero/omnis/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/splits/workouts/day/libero/omnis/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "workout": {
        "id": 1,
        "code": "FBB21",
        "title": "Full Body Blaster",
        "slug": "full-body-blaster",
        "duration": "10:30",
        "instructions": "fvadfadfa",
        "description": "fadsfadfda",
        "type": "warmup,exercise",
        "warm_ups": null,
        "post_streches": null,
        "focus_area": "Full Body",
        "level": "Advanced",
        "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/workouts\/images\/1623067648.jpg",
        "good_for": "vdzvz",
        "calories_burned": 56,
        "video_link": "https:\/\/docs.google.com\/spreadsheets\/d\/1pL55jhFOqmZrCguW79clLSf6IJYHeCPyP7VVEFIXNRM\/edit#gid=0",
        "tags": "exercise,health,nutrition",
        "visible": 1,
        "created_at": "2021-05-13 06:56:08",
        "updated_at": "2021-06-07 12:07:28"
    }
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "split Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/splits/workouts/day/{id}/{day}/{duration}`

#### URL Parameters

Parameter | Status | Description
--------- | ------- | ------- | -------
    `id` |  required  | The ID of the split.
    `day` |  required  | The day of the split.

<!-- END_d8d302c7da47cccf34d622654a10c51e -->

#Strech


<!-- START_900c5ff3a20ce83dac017c8c97150e52 -->
## api/user/favourite/streches
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/favourite/streches" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/favourite/streches"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "streches": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "based_on": "reps",
                "duration": "10:30",
                "reps": 5,
                "focus_area": "Full Body",
                "specific_muscles": "Core, Shoulders",
                "good_for": "vdzvz",
                "type": "warmup,exercise",
                "level": "Advanced",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/exercises\/images\/1623067648.jpg"
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/user\/favourite\/streches?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/user\/favourite\/streches?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/user\/favourite\/streches",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Strech Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/user/favourite/streches`


<!-- END_900c5ff3a20ce83dac017c8c97150e52 -->

<!-- START_ddf1796909871db5b50e5faa9769abef -->
## api/user/recent/streches
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/recent/streches" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/recent/streches"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "streches": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "based_on": "reps",
                "duration": "10:30",
                "reps": 5,
                "focus_area": "Full Body",
                "specific_muscles": "Core, Shoulders",
                "good_for": "vdzvz",
                "type": "warmup,exercise",
                "level": "Advanced",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/exercises\/images\/1623067648.jpg"
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/user\/recent\/streches?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/user\/recent\/streches?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/user\/recent\/streches",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Strech Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/user/recent/streches`


<!-- END_ddf1796909871db5b50e5faa9769abef -->

<!-- START_0f94928ddad4b76ad566676ace100cc6 -->
## api/strech/all
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/strech/all" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/strech/all"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "streches": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "based_on": "reps",
                "duration": "10:30",
                "reps": 5,
                "focus_area": "Full Body",
                "specific_muscles": "Core, Shoulders",
                "good_for": "vdzvz",
                "type": "warmup,exercise",
                "level": "Advanced",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/streches\/images\/1623067648.jpg"
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/strech\/all?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/strech\/all?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/strech\/all",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Strech Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/strech/all`


<!-- END_0f94928ddad4b76ad566676ace100cc6 -->

<!-- START_0a606ce79d36c73e9025ad1851814508 -->
## api/strech/single/{id}
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/strech/single/cum" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/strech/single/cum"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "strech": {
        "id": 1,
        "title": "Full Body Blaster",
        "code": "FBB21",
        "slug": "full-body-blaster",
        "category_id": 2,
        "duration": "10:30",
        "instructions": "<p>fvadfadfa<\/p>",
        "description": "<p>fadsfadfda<\/p>",
        "video_link": "https:\/\/docs.google.com\/spreadsheets\/d\/1pL55jhFOqmZrCguW79clLSf6IJYHeCPyP7VVEFIXNRM\/edit#gid=0",
        "reps": "5",
        "focus_area": "Full Body",
        "specific_muscles": "Core, Shoulders",
        "good_for": "vdzvz",
        "type": "warmup,exercise",
        "Notes": null,
        "level": "Advanced",
        "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/exercises\/images\/1623067648.jpg",
        "tags": "exercise,health,nutrition",
        "created_at": "2021-05-13 06:56:08",
        "updated_at": "2021-06-07 12:07:28"
    }
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Strech Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/strech/single/{id}`

#### URL Parameters

Parameter | Status | Description
--------- | ------- | ------- | -------
    `id` |  required  | The ID of the strech.

<!-- END_0a606ce79d36c73e9025ad1851814508 -->

#User management


<!-- START_ae7157bdc98b9ab1d396908205d3cd02 -->
## api/user/questionset1/update
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/questionset1/update" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"gender":"male","age":"32","level":"\"Beginner\"","height":"5.6","weight":"67","goal":"body building"}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/questionset1/update"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "gender": "male",
    "age": "32",
    "level": "\"Beginner\"",
    "height": "5.6",
    "weight": "67",
    "goal": "body building"
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "Question Set 1 updated successfully..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "User Not Found..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/user/questionset1/update`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `gender` | string |  required  | The gender of the user.
        `age` | string |  required  | The age of the user.
        `level` | string |  required  | The fitness level of the user.
        `height` | string |  required  | The height of the user.
        `weight` | string |  required  | The weight of the user.
        `goal` | string |  required  | The goal of the user.
    
<!-- END_ae7157bdc98b9ab1d396908205d3cd02 -->

<!-- START_84e45e9e18d4c534666b63819774856f -->
## api/user/questionset2/update
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/questionset2/update" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"questions":"[1, 2]","answers":"[\"A person's ability to exercise continuously for extended periods without needing to think\", \"Extreme tiredness, typically resulting from mental or physical exertion or illness\"]"}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/questionset2/update"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "questions": "[1, 2]",
    "answers": "[\"A person's ability to exercise continuously for extended periods without needing to think\", \"Extreme tiredness, typically resulting from mental or physical exertion or illness\"]"
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "Question Set 2 updated successfully..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "User Not Found..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/user/questionset2/update`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `questions` | array |  required  | The questions attempt by the user.
        `answers` | array |  required  | The answers given by the user.
    
<!-- END_84e45e9e18d4c534666b63819774856f -->

<!-- START_a30539a7b6819542856738f9655b4324 -->
## APIs for user program subscription

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/program/subscribe" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"program_id":4}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/program/subscribe"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "program_id": 4
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "User subscribed to the program successfully..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Unable to subscribe the user to the program..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/user/program/subscribe`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `program_id` | integer |  optional  | The program id of the program.
    
<!-- END_a30539a7b6819542856738f9655b4324 -->

<!-- START_bf51d773d215bac58a9f8569deb11404 -->
## APIs for getting user program subscriptions

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/program/subscriptions" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/program/subscriptions"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "subscriptions": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "subscription_no": 61003452,
                "user_id": 6,
                "program_id": 2,
                "start_date": "2021-07-27",
                "end_date": "2021-10-25",
                "total_days": 90,
                "status": "ACTIVE",
                "created_at": "2021-07-27 10:03:45",
                "updated_at": "2021-07-27 10:07:18",
                "user_progress_count": 1,
                "user_progress_percent": 100
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/user\/program\/subscriptions?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/user\/program\/subscriptions?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/program\/subscriptions",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Subscriptions Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/user/program/subscriptions`


<!-- END_bf51d773d215bac58a9f8569deb11404 -->

<!-- START_686477abf99f6834b6032825ed4585b4 -->
## APIs for saving user program subscription progress

> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/program/subscription/progress" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"subscription_id":8,"workout_id":11,"day":15}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/program/subscription/progress"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "subscription_id": 8,
    "workout_id": 11,
    "day": 15
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "progress saved successfully..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "unable to save progress..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/user/program/subscription/progress`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `subscription_id` | integer |  required  | The id of the subscription
        `workout_id` | integer |  required  | The id of the workout.
        `day` | integer |  required  | The day of the subscription.
    
<!-- END_686477abf99f6834b6032825ed4585b4 -->

<!-- START_d7d7495fb6c38fa0864c24cf8c7f279c -->
## API for getting user program subscription progress

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/program/subscription/progress/similique" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/program/subscription/progress/similique"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "progress": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "subscription_no": 71202109031,
                "workout_id": 3,
                "day": 1,
                "date": "2021-07-27",
                "created_at": "2021-07-28 11:27:26",
                "updated_at": "2021-07-28 11:27:26"
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/user\/program\/subscription\/progress?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/user\/program\/subscription\/progress?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/program\/subscription\/progress",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true,
    "progressCount": 1,
    "progressPercent": 33.333333333333336
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Subscriptions Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/user/program/subscription/progress/{subscriptionId}`

#### URL Parameters

Parameter | Status | Description
--------- | ------- | ------- | -------
    `subscriptionId` |  required  | The id of the subscription.

<!-- END_d7d7495fb6c38fa0864c24cf8c7f279c -->

<!-- START_9b205442d4d29c8e79a4f0edaf7b352c -->
## API for resetting user program subscription progress

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/program/subscription/reset/consequatur" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/program/subscription/reset/consequatur"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "Subscription progress reset successfully..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Subscriptions Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/user/program/subscription/reset/{subscriptionId}`

#### URL Parameters

Parameter | Status | Description
--------- | ------- | ------- | -------
    `subscriptionId` |  required  | The id of the subscription.

<!-- END_9b205442d4d29c8e79a4f0edaf7b352c -->

<!-- START_ae1c0fdb2b5a5f5113b30dcada9b779d -->
## APIs for user split subscription

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/split/subscribe" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"split_id":4}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/split/subscribe"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "split_id": 4
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "User subscribed to the split successfully..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Unable to subscribe the user to the split..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/user/split/subscribe`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `split_id` | integer |  optional  | The split id of the split.
    
<!-- END_ae1c0fdb2b5a5f5113b30dcada9b779d -->

<!-- START_4dd03a0b29dd4b1831ce54d17605034b -->
## APIs for getting user split subscriptions

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/split/subscriptions" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/split/subscriptions"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "subscriptions": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "subscription_no": 61003452,
                "user_id": 6,
                "split_id": 2,
                "start_date": "2021-07-27",
                "end_date": "2021-10-25",
                "total_days": 90,
                "status": "ACTIVE",
                "created_at": "2021-07-27 10:03:45",
                "updated_at": "2021-07-27 10:07:18",
                "user_progress_count": 1,
                "user_progress_percent": 100
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/user\/split\/subscriptions?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/user\/split\/subscriptions?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/split\/subscriptions",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Subscriptions Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/user/split/subscriptions`


<!-- END_4dd03a0b29dd4b1831ce54d17605034b -->

<!-- START_05f4b43b6780ccb0b8bb445f59c41772 -->
## APIs for saving user split subscription progress

> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/split/subscription/progress" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"subscription_id":9,"workout_id":12,"day":11}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/split/subscription/progress"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "subscription_id": 9,
    "workout_id": 12,
    "day": 11
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "progress saved successfully..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "unable to save progress..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/user/split/subscription/progress`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `subscription_id` | integer |  required  | The id of the subscription
        `workout_id` | integer |  required  | The id of the workout.
        `day` | integer |  required  | The day of the subscription.
    
<!-- END_05f4b43b6780ccb0b8bb445f59c41772 -->

<!-- START_9ff7c99c895d29551546e5d60cc08aad -->
## API for getting user split subscription progress

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/split/subscription/progress/minus" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/split/subscription/progress/minus"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "progress": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "subscription_id": 1,
                "workout_id": 3,
                "day": 1,
                "date": "2021-07-27",
                "created_at": "2021-07-28 11:27:26",
                "updated_at": "2021-07-28 11:27:26"
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/user\/split\/subscription\/progress?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/user\/split\/subscription\/progress?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/split\/subscription\/progress",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true,
    "progressCount": 1,
    "progressPercent": 33.333333333333336
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Subscriptions Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/user/split/subscription/progress/{subscriptionId}`

#### URL Parameters

Parameter | Status | Description
--------- | ------- | ------- | -------
    `subscriptionId` |  required  | The id of the subscription.

<!-- END_9ff7c99c895d29551546e5d60cc08aad -->

<!-- START_18650e249af5fbe03047db590114f8ad -->
## API for resetting user split subscription progress

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/split/subscription/reset/vel" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/split/subscription/reset/vel"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "Subscription progress reset successfully..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Subscriptions Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/user/split/subscription/reset/{subscriptionId}`

#### URL Parameters

Parameter | Status | Description
--------- | ------- | ------- | -------
    `subscriptionId` |  required  | The id of the subscription.

<!-- END_18650e249af5fbe03047db590114f8ad -->

<!-- START_55f210b976edef176fdbca00101eb57c -->
## api/user/favourite/resource
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/favourite/resource" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"exercise_id":1,"workout_id":2,"program_id":4,"split_id":3,"strech_id":3}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/favourite/resource"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "exercise_id": 1,
    "workout_id": 2,
    "program_id": 4,
    "split_id": 3,
    "strech_id": 3
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "resource favourited successfully..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Unable to favourite resource..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/user/favourite/resource`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `exercise_id` | integer |  optional  | The exercise id of the exercise.
        `workout_id` | integer |  optional  | The workout id of the workout.
        `program_id` | integer |  optional  | The program id of the program.
        `split_id` | integer |  optional  | The split id of the split.
        `strech_id` | integer |  optional  | The split id of the split.
    
<!-- END_55f210b976edef176fdbca00101eb57c -->

<!-- START_89f2e090372927f061e1b3a9182479eb -->
## api/user/recent/resource
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/recent/resource" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"exercise_id":1,"workout_id":2,"program_id":4,"split_id":3,"strech_id":3}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/recent/resource"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "exercise_id": 1,
    "workout_id": 2,
    "program_id": 4,
    "split_id": 3,
    "strech_id": 3
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "Recent resource saved successfully..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Unable to save recent resource..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/user/recent/resource`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `exercise_id` | integer |  optional  | The exercise id of the exercise.
        `workout_id` | integer |  optional  | The workout id of the workout.
        `program_id` | integer |  optional  | The program id of the program.
        `split_id` | integer |  optional  | The split id of the split.
        `strech_id` | integer |  optional  | The split id of the split.
    
<!-- END_89f2e090372927f061e1b3a9182479eb -->

<!-- START_590a003e8134892c33b9e0597d34798f -->
## api/user/unfavourite/resource
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/unfavourite/resource" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"exercise_id":1,"workout_id":2,"program_id":4,"split_id":3,"strech_id":3}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/unfavourite/resource"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "exercise_id": 1,
    "workout_id": 2,
    "program_id": 4,
    "split_id": 3,
    "strech_id": 3
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "resource removed successfully..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Unable to remove favourite resource..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/user/unfavourite/resource`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `exercise_id` | integer |  optional  | The exercise id of the exercise.
        `workout_id` | integer |  optional  | The workout id of the workout.
        `program_id` | integer |  optional  | The program id of the program.
        `split_id` | integer |  optional  | The split id of the split.
        `strech_id` | integer |  optional  | The split id of the split.
    
<!-- END_590a003e8134892c33b9e0597d34798f -->

<!-- START_68d3124411929696f2a51941c0d41a57 -->
## api/user/profile/update
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/profile/update" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"name":"shubham agrawal","mobile":"9713879633","gender":"male","age":"32","level":"beginner","height":"5.6","weight":"55","goal":"bodybulding"}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/profile/update"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "name": "shubham agrawal",
    "mobile": "9713879633",
    "gender": "male",
    "age": "32",
    "level": "beginner",
    "height": "5.6",
    "weight": "55",
    "goal": "bodybulding"
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "User Profile updated successfully..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Unable to update User profile..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/user/profile/update`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `name` | string |  optional  | The name of the user.
        `mobile` | string |  optional  | The mobile of the user.
        `gender` | string |  optional  | The gender of the user.
        `age` | string |  optional  | The age of the user.
        `level` | string |  optional  | The level of the user.
        `height` | string |  optional  | The height of the user.
        `weight` | string |  optional  | The weight of the user.
        `goal` | string |  optional  | The goal of the user.
    
<!-- END_68d3124411929696f2a51941c0d41a57 -->

<!-- START_7d7d679568202ecb02aebb3c7d61e5dd -->
## api/user/profile/update/pic
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/profile/update/pic" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"image":"aut"}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/profile/update/pic"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "image": "aut"
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "User pic updated successfully..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Unable to update User pic..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/user/profile/update/pic`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `image` | blob |  required  | The image of the user.
    
<!-- END_7d7d679568202ecb02aebb3c7d61e5dd -->

<!-- START_a4251b7143964e3f7d9fb181a7b86ba5 -->
## api/user/profile
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/profile" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/profile"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "user": {
        "id": 6,
        "name": "shubham agrawal",
        "user_type": "customer",
        "email": "vickya819@gmail.com",
        "mobile": "9713879633",
        "gender": "male",
        "age": "32",
        "level": "beginner",
        "height": "5.6",
        "weight": "67",
        "fitness_goal": "body building",
        "email_verified_at": null,
        "type": "Core, Shoulders",
        "created_at": "2021-05-13 06:56:08",
        "updated_at": "2021-06-07 12:07:28"
    }
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "User Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Token Absent..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```

### HTTP Request
`GET api/user/profile`


<!-- END_a4251b7143964e3f7d9fb181a7b86ba5 -->

#Videos


<!-- START_163aba6e8558a53b9c4ee0dfa18a20e9 -->
## API for getting All videos

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/videos" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/videos"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "videos": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "What is Lorem Ipsum?",
                "slug": "what-is-lorem-ipsum",
                "url": "https:\/\/www.youtube.com\/embed\/yJehD2NEetw",
                "thumbnail": "https:\/\/i.ytimg.com\/vi\/AGnRVWiDHco\/hqdefault.jpg",
                "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
                "tags": "exercise,health,nutrition",
                "created_at": "2021-05-13 06:56:08",
                "updated_at": "2021-06-07 12:07:28"
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/videos?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/videos?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/videos",
        "per_page": 15,
        "prev_page_url": null,
        "to": 1,
        "total": 1
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Videos Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/videos`


<!-- END_163aba6e8558a53b9c4ee0dfa18a20e9 -->

#Workout


<!-- START_be3644e68bc07c0938fb2c39084e48a5 -->
## API for getting Favourite workouts

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/favourite/workouts" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/favourite/workouts"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "workouts": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "duration": "10:30",
                "focus_area": "Full Body",
                "level": "Advanced",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/workouts\/images\/1623067648.jpg",
                "good_for": "vdzvz",
                "calories_burned": 56
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/favourite\/workouts?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/favourite\/workouts?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/favourite\/workouts",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Workouts Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/user/favourite/workouts`


<!-- END_be3644e68bc07c0938fb2c39084e48a5 -->

<!-- START_6aeba499ef9f97b27f76f0d8659ad821 -->
## API for getting recent workouts

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/recent/workouts" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/recent/workouts"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "workouts": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "duration": "10:30",
                "focus_area": "Full Body",
                "level": "Advanced",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/workouts\/images\/1623067648.jpg",
                "good_for": "vdzvz",
                "calories_burned": 56
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/recent\/workouts?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/recent\/workouts?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/user\/recent\/workouts",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Workouts Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/user/recent/workouts`


<!-- END_6aeba499ef9f97b27f76f0d8659ad821 -->

<!-- START_ceaa554ff0047ba84a0eebab2fcf4a7e -->
## API for getting All workouts

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/workouts/all" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/workouts/all"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "workouts": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "duration": "10:30",
                "focus_area": "Full Body",
                "level": "Advanced",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/workouts\/images\/1623067648.jpg",
                "good_for": "vdzvz",
                "calories_burned": 56
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/workouts\/all?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/workouts\/all?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/workouts\/all",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Workouts Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/workouts/all`


<!-- END_ceaa554ff0047ba84a0eebab2fcf4a7e -->

<!-- START_8531085c11848db475f2df6c975cf44d -->
## API for getting single workout duration

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/workouts/duration/et" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/workouts/duration/et"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "workout": [
        "Beginner",
        "Intermediate"
    ]
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Workout Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/workouts/duration/{id}`

#### URL Parameters

Parameter | Status | Description
--------- | ------- | ------- | -------
    `id` |  required  | The ID of the workout.

<!-- END_8531085c11848db475f2df6c975cf44d -->

<!-- START_ff651d4880ed4b2de8739b43d9287b76 -->
## API for getting single workouts By Variation

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/workouts/single/variation/est" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"duration":13}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/workouts/single/variation/est"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "duration": 13
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "rest_durations": [
        "05:00"
    ],
    "workout": {
        "id": 1,
        "code": "FBB21",
        "title": "Full Body Blaster",
        "slug": "full-body-blaster",
        "duration": "10:30",
        "rest_duration": "05:22",
        "instructions": "fvadfadfa",
        "description": "fadsfadfda",
        "type": "warmup,exercise",
        "warm_ups": null,
        "post_streches": null,
        "focus_area": "Full Body",
        "level": "Advanced",
        "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/workouts\/images\/1623067648.jpg",
        "good_for": "vdzvz",
        "calories_burned": 56,
        "video_link": "https:\/\/docs.google.com\/spreadsheets\/d\/1pL55jhFOqmZrCguW79clLSf6IJYHeCPyP7VVEFIXNRM\/edit#gid=0",
        "tags": "exercise,health,nutrition",
        "visible": 1,
        "created_at": "2021-05-13 06:56:08",
        "updated_at": "2021-06-07 12:07:28"
    }
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Workout Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/workouts/single/variation/{id}`

#### URL Parameters

Parameter | Status | Description
--------- | ------- | ------- | -------
    `id` |  required  | The ID of the workout.
#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `duration` | integer |  required  | The duration for the workout.
    
<!-- END_ff651d4880ed4b2de8739b43d9287b76 -->

#playlist


<!-- START_a0d317847fbb2136d7b53ed7c0a1253b -->
## api/user/playlist/create
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/playlist/create" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"title":"aliquid"}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/playlist/create"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "title": "aliquid"
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "Playlist created successfully..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Unable to create playlist..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/user/playlist/create`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `title` | string |  required  | The title of the playlist.
    
<!-- END_a0d317847fbb2136d7b53ed7c0a1253b -->

<!-- START_1f7646d0c9a4cb0466afcd41d6632efc -->
## api/user/playlist/update
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/playlist/update" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"id":1,"title":"My playlist"}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/playlist/update"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "id": 1,
    "title": "My playlist"
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "User playlist updated successfully..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Unable to update User playlist..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/user/playlist/update`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `id` | integer |  required  | The id of the user playlist.
        `title` | string |  required  | The title of the user playlist.
    
<!-- END_1f7646d0c9a4cb0466afcd41d6632efc -->

<!-- START_cdd68b4824a95d34a9e68c76b90ba0d9 -->
## api/user/playlist/delete
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/playlist/delete" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"id":1}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/playlist/delete"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "id": 1
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "User playlist deleted successfully..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Unable to delete User playlist..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/user/playlist/delete`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `id` | integer |  required  | The id of the user playlist.
    
<!-- END_cdd68b4824a95d34a9e68c76b90ba0d9 -->

<!-- START_b969cb96a611831c5fa5b7376481bba6 -->
## API for getting all or single user playlist

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X GET \
    -G "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/playlist/hic" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/playlist/hic"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
null
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "No playlist found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`GET api/user/playlist/{playlist?}`

#### URL Parameters

Parameter | Status | Description
--------- | ------- | ------- | -------
    `playlist` |  optional  | int The ID of the playlist.

<!-- END_b969cb96a611831c5fa5b7376481bba6 -->

<!-- START_52846e21890ceb382048cd0eb01d990e -->
## api/playlist/saved/exercises
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/playlist/saved/exercises" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"playlistId":1}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/playlist/saved/exercises"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "playlistId": 1
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "exercises": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "based_on": "reps",
                "duration": "10:30",
                "reps": 5,
                "focus_area": "Full Body",
                "specific_muscles": "Core, Shoulders",
                "good_for": "vdzvz",
                "type": "warmup,exercise",
                "level": "Advanced",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/exercises\/images\/1623067648.jpg"
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/playlist\/saved\/exercises?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/playlist\/saved\/exercises?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/playlist\/saved\/exercises",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Exercise Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/playlist/saved/exercises`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `playlistId` | integer |  required  | The id of the playlist.
    
<!-- END_52846e21890ceb382048cd0eb01d990e -->

<!-- START_c600d954523a0ac7424b11820c0b231f -->
## API for getting Saved workouts

<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/playlist/saved/workouts" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"playlistId":1}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/playlist/saved/workouts"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "playlistId": 1
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "workouts": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "duration": "10:30",
                "focus_area": "Full Body",
                "level": "Advanced",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/workouts\/images\/1623067648.jpg",
                "good_for": "vdzvz",
                "calories_burned": 56
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/playlist\/saved\/workouts?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/playlist\/saved\/workouts?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/playlist\/saved\/workouts",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Workouts Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/playlist/saved/workouts`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `playlistId` | integer |  required  | The id of the playlist.
    
<!-- END_c600d954523a0ac7424b11820c0b231f -->

<!-- START_f3877430bef50a72960d7768a34b91df -->
## api/playlist/saved/programs
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/playlist/saved/programs" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"playlistId":1}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/playlist/saved/programs"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "playlistId": 1
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "programs": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "good_for": "vdzvz",
                "no_of_days": 90,
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/programs\/images\/1623067648.jpg",
                "focus_area": "Full Body",
                "duration": "10:30",
                "level": "Advanced",
                "frequency": 45
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/playlist\/saved\/programs?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/playlist\/saved\/programs?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/playlist\/saved\/programs",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "programs Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/playlist/saved/programs`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `playlistId` | integer |  required  | The id of the playlist.
    
<!-- END_f3877430bef50a72960d7768a34b91df -->

<!-- START_ffd6d37a1f015070c517faf96283e540 -->
## api/playlist/saved/splits
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/playlist/saved/splits" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"playlistId":1}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/playlist/saved/splits"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "playlistId": 1
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "splits": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "good_for": "vdzvz",
                "type": "warmup,exercise",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/splits\/images\/1623067648.jpg",
                "focus_area": "Full Body",
                "duration": "10:30",
                "level": "Advanced",
                "frequency": 45,
                "length": 5
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/playlist\/saved\/splits?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/playlist\/saved\/splits?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/\/api\/playlist\/saved\/splits",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "splits Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/playlist/saved/splits`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `playlistId` | integer |  required  | The id of the playlist.
    
<!-- END_ffd6d37a1f015070c517faf96283e540 -->

<!-- START_823bf5b8a97e4c5be2cdf43a1d419df3 -->
## api/playlist/saved/streches
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/playlist/saved/streches" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"playlistId":1}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/playlist/saved/streches"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "playlistId": 1
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "exercises": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "title": "Full Body Blaster",
                "based_on": "reps",
                "duration": "10:30",
                "reps": 5,
                "focus_area": "Full Body",
                "specific_muscles": "Core, Shoulders",
                "good_for": "vdzvz",
                "type": "warmup,exercise",
                "level": "Advanced",
                "image": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/uploads\/exercises\/images\/1623067648.jpg"
            }
        ],
        "first_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/playlist\/saved\/streches?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/playlist\/saved\/streches?page=1",
        "next_page_url": null,
        "path": "https:\/\/phpstack-250897-1931063.cloudwaysapps.com\/api\/playlist\/saved\/streches",
        "per_page": 15,
        "prev_page_url": null,
        "to": 4,
        "total": 4
    },
    "success": true
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Exercise Not Found..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/playlist/saved/streches`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `playlistId` | integer |  required  | The id of the playlist.
    
<!-- END_823bf5b8a97e4c5be2cdf43a1d419df3 -->

<!-- START_fc53638836f3cbcd8e23c5f8fad7f395 -->
## api/playlist/save/resource
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/playlist/save/resource" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"exercise_id":1,"workout_id":2,"program_id":4,"split_id":3,"strech_id":3,"playlist_id":1}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/playlist/save/resource"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "exercise_id": 1,
    "workout_id": 2,
    "program_id": 4,
    "split_id": 3,
    "strech_id": 3,
    "playlist_id": 1
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "resource saved successfully..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Unable to save resource..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/playlist/save/resource`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `exercise_id` | integer |  optional  | The exercise id of the exercise.
        `workout_id` | integer |  optional  | The workout id of the workout.
        `program_id` | integer |  optional  | The program id of the program.
        `split_id` | integer |  optional  | The split id of the split.
        `strech_id` | integer |  optional  | The strech id of the strech.
        `playlist_id` | integer |  required  | The id of the playlist.
    
<!-- END_fc53638836f3cbcd8e23c5f8fad7f395 -->

<!-- START_d06f6af77f97ac09ae6d11b0b9cb0067 -->
## api/playlist/unsave/resource
<br><small style="padding: 1px 9px 2px;font-weight: bold;white-space: nowrap;color: #ffffff;-webkit-border-radius: 9px;-moz-border-radius: 9px;border-radius: 9px;background-color: #3a87ad;">Requires authentication</small>
> Example request:

```bash
curl -X POST \
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/playlist/unsave/resource" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"exercise_id":1,"workout_id":2,"program_id":4,"split_id":3,"strech_id":3,"playlist_id":1}'

```

```javascript
const url = new URL(
    "https://phpstack-250897-1931063.cloudwaysapps.com/api/playlist/unsave/resource"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "exercise_id": 1,
    "workout_id": 2,
    "program_id": 4,
    "split_id": 3,
    "strech_id": 3,
    "playlist_id": 1
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "success": true,
    "message": "resource removed successfully..!!"
}
```
> Example response (404):

```json
{
    "success": false,
    "message": "Unable to remove saved resource..!!"
}
```
> Example response (401):

```json
{
    "success": false,
    "message": "Token is Invalid..!!"
}
```
> Example response (403):

```json
{
    "success": false,
    "message": "Token is Expired..!!"
}
```
> Example response (500):

```json
{
    "success": false,
    "message": "Internal server error..!!"
}
```

### HTTP Request
`POST api/playlist/unsave/resource`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `exercise_id` | integer |  optional  | The exercise id of the exercise.
        `workout_id` | integer |  optional  | The workout id of the workout.
        `program_id` | integer |  optional  | The program id of the program.
        `split_id` | integer |  optional  | The split id of the split.
        `strech_id` | integer |  optional  | The strech id of the strech.
        `playlist_id` | integer |  required  | The id of the playlist.
    
<!-- END_d06f6af77f97ac09ae6d11b0b9cb0067 -->


