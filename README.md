[![Build Status](https://travis-ci.org/kolyastepanets/shopping_cart_engine.svg?branch=master)](https://travis-ci.org/kolyastepanets/shopping_cart_engine)
[![Code Climate](https://codeclimate.com/repos/56e01578e17dc547dc00add1/badges/7880da470939308950fe/gpa.svg)](https://codeclimate.com/repos/56e01578e17dc547dc00add1/feed)
[![Test Coverage](https://codeclimate.com/repos/56e01578e17dc547dc00add1/badges/7880da470939308950fe/coverage.svg)](https://codeclimate.com/repos/56e01578e17dc547dc00add1/coverage)

Rails Engine performing simple shopping cart to your store

## Install

```
gem 'shopping_cart', git: 'git://github.com/kolyastepanets/shopping_cart_engine'
```

Run 'bundle install'

### Install migrations

```
rake shopping_cart:install:migrations
rake db:migrate
```

### Mount Engine

```
mount ShoppingCart::Engine, at: "/shopping"
```

### Add behaviour to your product in model
```
class Product < ActiveRecord::Base
  acts_as_product
end
```

### Add behaviour to user in model
```
class User < ActiveRecord::Base
  acts_as_user
end
```

### To customize views run
```
rails generate shopping_cart:views
```

### Add form to your product page
```
= form_tag(shopping_cart.order_items_path(book_id: @book)) do
  .input-group
    = number_field_tag(:quantity, 1, min: 1, class: 'form-control')
    .input-group-btn
      = submit_tag "Add to Cart", class: "btn btn-primary"
```
