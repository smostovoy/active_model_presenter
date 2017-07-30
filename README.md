# Welcome to ActionSerializer

ActionSerializer is a layer for Ruby-based frameworks and web-aplications.

## Getting Started

1. Add gem to you Bundle

        gem 'rails'

2. Call `serialize` in your action

        @user = serialize(user, UserSerializer::List)

   Serializer class is optional.

3. Change view forms to explicitly pass URL


## Contributing

We encourage you to create issues and to contribute to ActionSerializer! Please discuss your ideas with authors first.


## License

ActionSerializer is released under the [MIT License](http://www.opensource.org/licenses/MIT).