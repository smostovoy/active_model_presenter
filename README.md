# Welcome to ActionSerializer

ActionSerializer is a layer for Rails between Controller and View. 
It's an implementation of an architecture which can be called as MVCS (Model-View-Controller-Serializer).
Simplified flow is next:

![mvcs](/doc/mvc-to-mvcs.png)

### Benefits:
1. Standart place for a view-related logic
2. View data goes in 1 direction, like in API -> Frontend SPA app.
3. Easy caching, testing, re-usage, extending
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

## Contributing

We encourage you to create issues and to contribute to ActionSerializer! Please discuss your ideas with the authors first.


## License

ActionSerializer is released under the [MIT License](http://www.opensource.org/licenses/MIT).