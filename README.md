# Welcome to ActionSerializer

ActionSerializer is a layer for Rails between Controller and View. 
It's an implementation of MVCS architecture:

![mvcs](https://photos-4.dropbox.com/t/2/AAAYNzVL2Tbgn5erBm2ybEfm3VQUTq8tZ2MHksULm7be9w/12/14907920/png/32x32/3/1501534800/0/2/MVCS.png/ELb9iwsYvLcoIAcoBw/ylli1C5_CIME_4DD2IdLUjtkajBi_jpDAaRWqxSNPeo?dl=0&size=2048x1536&size_mode=3)

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