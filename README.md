# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

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
bundle exec rspec
```

* Deployment instructions
```
This is an API only that responds to the following endpoints:

post 'login', to: 'authentication#create'
post 'signup', to: 'users#create'
get 'users', to: 'users#index'
post 'friendships', to: 'friendships#create'
get 'users/me/friends', to: 'friendships#index'

Start the rails server (rails s) and use a tool like POSTMAN to test.
```

* QnA
```
For answers to the QnA please open the QnA.md file included in this repo.
```