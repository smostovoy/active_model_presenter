# Welcome to ActionSerializer

ActionSerializer is a layer for Rails between Controller and View. 
It introduces a standard place for a view-related logic and 
makes it easier to move your UI to frontend frameworks in future if you decide so.
Serialized item supports methods required by Rails form so it's a drop-in replacement for a model.

## Getting Started

1. Add gem to you Bundle

        gem 'action_serializer'

2. Call `serialize` in your action

        user = User.find(1)
        @user = serialize(user, UserSerializer)

   Serializer class is optional. By default serializer creates `@item` or `@coll` variables.

3. Change View forms to explicitly pass URL


## Contributing

We encourage you to create issues and to contribute to ActionSerializer! Please discuss your ideas with the authors first.


## License

ActionSerializer is released under the [MIT License](http://www.opensource.org/licenses/MIT).