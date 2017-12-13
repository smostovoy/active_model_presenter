# SerializedObject
Serialized Objects simplify your views and models just like Service Objects simplify your controllers/models.  
SerializedObject is a small library that serializes any object to a hash/json and provides pseudo-object attributes access.  
It's based on ActiveModelSerializer gem so you get all it's features.  
It can be used as a layer for Rails between Controller and View to make data flow in 1 direction. 

![mvcs](/doc/mvc-to-mvcs.png)

## Benefits:

1. Everything is calculated only once. So you don't need to write things like
    ```ruby
    def foo
      @foo ||= calculate('bar')
    end
    ```
    Such objects can be useful in many cases.
2. Serializers can be a standard place for a view(frontend)-related logic
3. View layer will not make DB queries. Data goes in 1 direction, like in API -> Frontend SPA app.
4. Easy caching - just add `cache: true` in your serializer 
5. Better testing - checking controller assings (full hash) gives much higher confidence
6. DRY - Default AMS serializers support `has_many`, `belongs_to` and simple inheritance

## Features
1. Serialized object acts like a plain ruby object but can be converted to hash or json at any moment.
2. Based on time-tested ActiveModelSerializer gem
3. Collections are compatible with paginators like `will_paginate` and `kaminari` gems.

## Example

Method `serialize` does all the magic
```ruby
 # /app/controllers/posts_controller.rb
 class PostsController < ApplicationController
   def show  
     post = Post.find(params[:id])
     @post = serialize(post)
   end
 end
``` 

Serializers are regular ActiveModelSerializer classes: 
```ruby
 # /app/serializers/post_serializer.rb
 class PostSerializer < SerializedObject::Base
   attributes :id, :title, :content, :comments_count
     
   has_many :comments
     
   def comments_count
     comments.count
   end
 end 
 
 # /app/serializers/comment_serializer.rb
 class CommentSerializer < SerializedObject::Base
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
    gem 'serialized_object'
    ```
 
2. Call `serialize` in your action
    
    ```ruby
    def show  
      user = User.find(params[:id])
      @user = serialize(user, UserSerializer)
    end  
    ```

   Method `serialize` returns `SerializedObject::Model` object.  

   Collections are handled same way.
   
   ```ruby
   @users = serialize(users)
   ```  
     
   Here `serialize` returns `SerializedObject::Collection` object, which is compatible with paginators.
       
3. or use manual initializing:
   ```ruby
   serialized_user = SerializedObject::Model.create(user, UserSerializer)
   ```

Check out also [Active Model Serializers](https://github.com/rails-api/active_model_serializers/tree/v0.10.6) page about syntax for serializers.

## Contributing

We encourage you to create issues and to contribute to SerializedObject! Please discuss your ideas with the authors first.


## License

SerializedObject is released under the [MIT License](http://www.opensource.org/licenses/MIT).