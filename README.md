# Welcome to ActionSerializer

ActionSerializer is a layer for Rails between Controller and View. 
It's an implementation of MVCS architecture:
![mvcs](https://photos-4.dropbox.com/t/2/AACL4SdKcsOs40ntM3wnkKAH4tghJvbRFyxBLRV67rqB5Q/12/14907920/png/32x32/3/1501534800/0/2/MVCS.png/ELb9iwsYubcoIAcoBw/PzDFaTtA5rG2zEaoo5UfVGE7s3lc74aeKMe3SIZsY8A?dl=0&size=2048x1536&size_mode=3)
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