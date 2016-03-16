[![Build Status](https://travis-ci.org/kolyastepanets/shopping_cart_engine.svg?branch=master)](https://travis-ci.org/kolyastepanets/shopping_cart_engine)
[![Code Climate](https://codeclimate.com/repos/56e01578e17dc547dc00add1/badges/7880da470939308950fe/gpa.svg)](https://codeclimate.com/repos/56e01578e17dc547dc00add1/feed)
[![Test Coverage](https://codeclimate.com/repos/56e01578e17dc547dc00add1/badges/7880da470939308950fe/coverage.svg)](https://codeclimate.com/repos/56e01578e17dc547dc00add1/coverage)

# Rails Engine adds simple shopping cart and checkout to your project

## Install

```ruby
gem 'shopping_cart', git: 'git://github.com/kolyastepanets/shopping_cart_engine'
```

Run `bundle install`

### Install migrations

```ruby
rake shopping_cart:install:migrations
rake db:migrate
```

### Mount Engine

```ruby
Rails.application.routes.draw do
  mount ShoppingCart::Engine, at: "/shopping"
end
```

### Also you need to set root inside your routes
```ruby
root to: "home#index"
```

### Add behaviour to your product in model
```ruby
class Book < ActiveRecord::Base
  acts_as_product
end
```

### Add behaviour to user in model
```ruby
class User < ActiveRecord::Base
  acts_as_user
end
```

### To customize views run
```ruby
rails generate shopping_cart:views
```
Views will be created app/views/shopping_cart/...

### Add form to your product page
```ruby
= form_tag(shopping_cart.order_items_path(book_id: @book)) do
  = number_field_tag(:quantity, 1, min: 1, class: 'form-control')
  = submit_tag "Add to Cart", class: "btn btn-primary"
```

### Unless you are using Devise, you have to add method to Application Controller
```ruby
class ApplicationController < ActionController::Base
  def current_user
    @user
  end
end

```
