# ActiveModelPresenter
[![Build Status](https://travis-ci.org/smostovoy/active_model_presenter.svg?branch=master)](https://travis-ci.org/smostovoy/active_model_presenter)

Presenters and Model-View-Presenter (MVP) is the second most useful pattern after Service Objects to simplify your rails app.  
**ActiveModelPresenter** is a small gem that transforms ActiveRecord models into simple decorated objects that you can use to pass data for a JSON or a regular View rendering.  
It's based on Rails' **active_model_serializers** gem (AMS) so you get all it's features without creating any new type of files.  
It can be used as a layer for Rails between Controller and View to make data to flow in 1 direction. 

![mvcs](/doc/mvc-to-mvcs.png)
    
## Features
1. Presenter acts like a plain static ruby object but can be converted to a hash or a json at any moment.
2. Based on time-tested _active_model_serializers_ gem
3. Collections are compatible with paginators like `will_paginate` and `kaminari` gems.

## Benefits:
1. Presenters (serializers) can be an additional encapsulation layer for a view/frontend/api-related logic
2. Unidirectional data flow -  DB queries will not happen from a View layer (it means caching a view will not make much sense)
3. Easy caching - just add `cache: true` in your serializer. (Read AMS docs for more info) 
4. Better testing - it's possible to unit-test a Presenter and check all attributes
5. DRY - Same as Service Objects they allow you to keep domain-related logic in 1 place and have an easy access to it
6. AMS serializers already support `has_many`, `belongs_to` and inheritance
7. Everything is calculated only once. So you don't need to write memoizations like this:
    ```ruby
    def foo
      @foo ||= 2**100
    end
    ```
    
## Example
Method `present` does all the magic
```ruby
 # /app/controllers/posts_controller.rb
 class PostsController < ApplicationController
   def show  
     post = Post.find(params[:id])
     @post = present(post)
   end
 end
``` 

Presenters are regular ActiveModelSerializer classes: 
```ruby
 # /app/serializers/post_serializer.rb
 class PostSerializer < ActiveModel::Serializer
   attributes :id, :title, :content, :comments_count
     
   has_many :comments
     
   def comments_count
     comments.count
   end
 end 
 
 # /app/serializers/comment_serializer.rb
 class CommentSerializer < ActiveModel::Serializer
   attributes :id, :message, :author_name
     
   def author_name
     object.user.name
   end
 end   
```

Views for show/index are same as default ones, but they can access only defined attributes.
```html
 # /app/views/posts/show.html.erb

<h1><%= @post.title %></h1>
<div><%= @post.content %></div>

<h2>Comments (<%= @post.comments_count %>): </h2>
<div>
    <% @post.comments.each do |comment| %>
      <div>
        <div><%= comment.author_name %></div>
        <div><%= comment.message %></div>
      </div>  
    <% end %>
</div>
```

## Getting Started

1. Add gem to you Gemfile
    
    ```ruby
    gem 'active_model_presenter'
    ```
 
2. Call `present` in your action
    
    ```ruby
    def show  
      user = User.find(params[:id])
      @user = present(user, UserSerializer)
    end  
    ```

   Method `present` returns a `ActiveModelPresenter::Model` object class.  

   Collections are handled same way.
   
   ```ruby
   @users = present(users)
   ```  
     
   Here `present` returns a `ActiveModelPresenter::Collection` object, which is compatible with paginators.
       
3. or use manual initializing:
   ```ruby
   @user = ActiveModelPresenter::Model.new(user, UserSerializer)
   ```

Check out also [active_model_serializers](https://github.com/rails-api/active_model_serializers/tree/v0.10.6) page about syntax for serializers.

## Contributing

We encourage you to create issues and to contribute to ActiveModelPresenter! Please discuss your ideas with the authors first.


## License

ActiveModelPresenter is released under the [MIT License](http://www.opensource.org/licenses/MIT).