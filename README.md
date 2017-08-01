# Welcome to ActionSerializer

ActionSerializer is a layer for Rails between Controller and View. 
It's an implementation of new architecture which can be called MVCS (Model-View-Controller-Serializer):

![mvcs](https://photos-3.dropbox.com/t/2/AABkdEMTI7RNXgKqKeZXpzAV2vdgWXUzXvNsdnKhAPjlQA/12/14907920/png/32x32/1/_/1/2/MVC%20to%20MVCS.png/ELb9iwsYv7coIAcoBw/YMe_PehOKBqrmN0hyUy4EFWKw3s2UTuU4YJ5keuc30s?size=32x32&size_mode=3)

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