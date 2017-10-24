# Welcome to ActionSerializer

ActionSerializer is a layer for Rails between Controller and View. 
It's an implementation of an architecture which can be called as MVCS (Model-View-Controller-Serializer).
Simplified flow is next:

![mvcs](/doc/mvc-to-mvcs.png)

### Benefits:
1. Standart place for a view-related logic
2. View data goes in 1 direction, like in API -> Frontend SPA app.
3. Easy caching, testing, re-usage, extending, performance control
4. Based on time-tested Active Model Serializers
5. Acts like a plain ruby object but has a `to_h` and `to_json` methods


## Getting Started

1. Add gem to you Gemfile
    
    ```ruby
    gem 'action_serializer'
    ```
 
2. Call `serialize` in your action
    
    ```ruby
    def show  
      user = User.find(params[:id])
      @user = serialize(user)
    end  
    ```
   By default, serializer class name is `model name + "Serializer"`, same as in AMS. But you can pass it as an option:
   
   ```ruby
   @user = serialize(user, UserSerializer)
   ```

   Collections are handled same way.
   
   ```ruby
   @users = serialize(users)
   ```  
        
   Pagination is compatible with `will_paginate` and `kaminari`
       

Check out also [Active Model Serializers](https://github.com/rails-api/active_model_serializers/tree/v0.10.6) page for more information.

## Example

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

```html
 # /app/views/posts/edit.html.erb

<% form_for @post, url: post_path(@post), builder: SerializedFormBuilder do |f| %>
    <%= f.text_field :title %>
    <%= f.text_field :content %>
<% end %>
```

## Contributing

We encourage you to create issues and to contribute to ActionSerializer! Please discuss your ideas with the authors first.


## License

ActionSerializer is released under the [MIT License](http://www.opensource.org/licenses/MIT).