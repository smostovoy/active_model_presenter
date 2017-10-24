# Welcome to ActionSerializer

ActionSerializer is a layer for Rails between Controller and View based on ActiveModelSerializer gem. 
It's an implementation of an architecture which can be called as MVCS (Model-View-Controller-Serializer).
Simplified flow is next:

![mvcs](/doc/mvc-to-mvcs.png)

### Benefits:
1. Standart place for a view-related logic
2. View layer does not make DB queries. Data goes in 1 direction, like in API -> Frontend SPA app.
3. Easy caching - just add `cache: true` in your serializer 
4. Better testing - checking controller assings (full hash) gives much higher confidence
5. DRY - Default AMS serializers support `has_many`, `belongs_to` and simple inheritance

### Features
1. Serialized object acts like a plain ruby object but can be converted to hash or json
2. Based on time-tested AMS gem
3. Compatible with default rails form helpers


## Getting Started

1. Add gem to you Gemfile
    
    ```ruby
    gem 'action_serializer'
    ```
 
2. Call `serialize` in your action
    
    ```ruby
    def show  
      user = User.find(params[:id])
      @user = serialize(user, UserSerializer)
    end  
    ```

   Method `serialize` returns `ActionSerializer::Model` object, which is compatible with rails forms  

   Collections are handled same way.
   
   ```ruby
   @users = serialize(users)
   ```  
     
   Here `serialize` returns `ActionSerializer::Collection` object, which is compatible with pagination from `will_paginate` and `kaminari` gems.
       

Check out also [Active Model Serializers](https://github.com/rails-api/active_model_serializers/tree/v0.10.6) page about syntax for serializers.

## Example

Method `serialize` does all the magic
```ruby
 # /app/controllers/posts_controller.rb
 class PostsController < ApplicationController
   def show  
     post = Post.find(params[:id])
     @post = serialize(post)
   end
   
   def edit  
     post = Post.find(params[:id])
     @post = serialize(post)
   end
 end
``` 

Serializers a default ActiveModelSerializer classes 
```ruby
 # /app/serializers/post_serializer.rb
 class PostSerializer < ActionSerializer::Base
   attributes :id, :title, :content, :author_name
     
   has_many :comments
     
   def author_name
     object.user.name
   end
 end 
 
 # /app/serializers/comment_serializer.rb
 class CommentSerializer < ActionSerializer::Base
   attributes :id, :message, :author_name
     
   def author_name
     object.user.name
   end
 end   
```

Views for show/index are same as default ones, but it can access only defined attributes.
```html
 # /app/views/posts/show.html.erb

<h1><%= @post.title %></h1>
<h2><%= @post.author_name %></h2>
<div><%= @post.content %></div>

<div>
    <% @post.comments.each do |comment| %>
      <div>
        <div><%= comment.author_name %></div>
        <div><%= comment.message %></div>
      </div>  
    <% end %>
</div>
```
Forms just need to specify some params in form_for, everything else is as in default form.

```html
 # /app/views/posts/edit.html.erb

<% form_for @post, builder: SerializedFormBuilder, url: post_path(@post), method: :put do |f| %>
    <%= f.text_field :title %>
    <%= f.text_field :content %>
<% end %>
```

## Contributing

We encourage you to create issues and to contribute to ActionSerializer! Please discuss your ideas with the authors first.


## License

ActionSerializer is released under the [MIT License](http://www.opensource.org/licenses/MIT).