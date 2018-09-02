# ActiveModelPresenter
[![Build Status](https://travis-ci.org/smostovoy/active_model_presenter.svg?branch=master)](https://travis-ci.org/smostovoy/active_model_presenter)

Have you had a problem that it's impossible to understand what methods/attributes are called in your Views?
With ActiveModelPresenter you will have a full control of data that is exposed to views.
Presenters and Model-View-Presenter (MVP) is the second most useful pattern after Service Objects to improve supportability of your rails app. 

![mvcs](/doc/mvc-to-mvcs.png)

## Benefits:
1. List of exposed fields is explicitly defined
2. Presenters (serializers) can be an additional encapsulation layer for a view/frontend/api-related logic
3. Makes you 1 step closer to exposing a JSON API or allows you to DRY if you already do.
4. Better testing - it's possible to unit-test a Presenter and check all attributes
5. DRY - Same as Service Objects they allow you to keep domain-related logic in 1 place and have an easy access to it
6. All queries and calculations now will happen in a presenter so no more crazy rendering time.
Everything is calculated only once. So you don't need to write memoizations like `@foo ||= 2**100`. It means caching a view will not make much sense

## Features
1. Presenter acts like a plain static ruby object but can be converted to a hash or a json at any moment.
2. Makes it easy to pass options to a serializer
3. Based on time-tested _active_model_serializers_ gem
4. Collections are compatible with paginators like `will_paginate` and `kaminari` gems.

## Main ActiveModelSerializers Features that are utilized by a presenter
1. fields filtering - serialize/present only a subset of attributes that are listed in a serializer
2. `has_many`, `belongs_to` and other relations
3. ability to override/extend methods from a model
4. Caching - just add `cache: true` in your serializer. Just think about cache invalidation strategy (Read AMS docs for more info) 

    
## Example
```ruby
 # /app/controllers/posts_controller.rb
 class PostsController < ApplicationController
   def show  
     post = Post.find(params[:id])
     @post = PostPresenter.show(post)
   end
 end
``` 
Presenter: 
```ruby
 # /app/presenters/post_presenter.rb
 class PostSerializer < ActiveModelPresenter::Model     
   def show(post)
     new(post, fields: [:id, :title, :content, :comments_count])
   end
   
   def show_full(post)
     new(post, fields: [:id, :title, :content, :comments_count, :comments])
   end
 end 
```

Presenters are using regular ActiveModelSerializer classes: 
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

1. Add the gem name to your Gemfile
    
    ```ruby
    gem 'active_model_presenter'
    ```
 
2. Call presenter in your action
    
    ```ruby
    def show  
      user = User.find(params[:id])
      @user = UserPresenter.show(user)
    end  
    ```

   Collections are handled same way.
   
   ```ruby
   @users = UserPresenter.list(users)
   ```  
     
   Here presenter returns a `ActiveModelPresenter::Collection` object, which is compatible with paginators.
       
   ```

See more information about serializers [here](https://github.com/rails-api/active_model_serializers/tree/v0.10.6) page about syntax for serializers.

## Contributing

We encourage you to create issues and to contribute to ActiveModelPresenter! Please discuss your ideas with the authors first.


## License

ActiveModelPresenter is released under the [MIT License](http://www.opensource.org/licenses/MIT).