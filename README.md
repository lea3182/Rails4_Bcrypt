## README

#### This README documents the steps used to integrate Bcrypt with Rails 4 for user authentication. Fu

* Add `gem 'bcrypt', '~> 3.1.7'` in Gemfile
* bundle install

* rails g model User

* Add `has_secure_password` to User model

* Edit migration to include, name, email and `password_digest`

* be rake db:create

* be rake db:migrate

* rails g controller users

* NOTE:  `create` action seems to require strong parameters in order to successfully create new user

* rails g controller sessions

* In `app/helpers/sessions_helper.rb` add
```ruby
def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end
```

* In `app/controllers/application_controller` add `include SessionsHelper`
