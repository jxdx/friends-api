# README

* Ruby version
```
Ruby 2.7.0
```

* Rails version
```
Rails 5.2.4.6
```

* Database creation
```
rails db:create
```

* Database initialization
```
rails db:migrate
```

* How to run the test suite
```
Run the following command in the rails console:
bundle exec rspec
```

* Deployment instructions
```
Start the rails server (rails s) and use a tool like POSTMAN to test.

This is an API only that responds to the following endpoints with examples:

post 'signup', to: 'users#create'
http://localhost:3000/signup?email=jxdxio@gmail.com&name=Josh Davies&password=password1

Sample response:
{
    "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2LCJleHAiOjE2MjI2Njc2MDN9.s7_XFtChYV-xoEBnJx5PajwbrYM5lRGYetnRN7S2Jjo"
}

post 'login', to: 'authentication#create'
http://localhost:3000/login?email=jxdxio@gmail.com&password=password1

Sample response:
{
    "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2LCJleHAiOjE2MjI2Njc2MDN9.s7_XFtChYV-xoEBnJx5PajwbrYM5lRGYetnRN7S2Jjo"
}

get 'users', to: 'users#index'
http://localhost:3000/users

Sample response:
{
    "users": [
        {
            "name": "Josh Davies",
            "email": "jxdxio2@gmail.com"
        },
        {
            "name": "Frank Davies",
            "email": "josh@gmail.com"
        }
    ]
}

post 'friendships', to: 'friendships#create'
http://localhost:3000/friendships?email=jxdxio2@gmail.com

Sample response: 
{
    "friendship": {
        "user": {
            "name": "Josh Davies",
            "email": "jxdxio@gmail.com"
        },
        "friend": {
            "name": "Josh Davies",
            "email": "jxdxio2@gmail.com"
        }
    }
}

get 'users/me/friends', to: 'friendships#index'
http://localhost:3000/users/me/friends
```

Sample response:
{
    "friends": [
        {
            "name": "Josh Davies",
            "email": "jxdxio2@gmail.com"
        }
    ]
}

* QnA
```
For answers to the QnA please open the QnA.md file included in this repo.
```