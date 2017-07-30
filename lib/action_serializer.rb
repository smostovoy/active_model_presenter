module ActionSerializer
  extend ActiveSupport::Concern

  included do
    if respond_to?(:hide_action)
      hide_action :serialize
    end
  end

  def serialize(object, serializer = nil)
    if object.is_a?(Array) || object.class.name == 'ActiveRecord::Relation'
      @coll = SerializedCollection.new(object, serializer)
    else
      @item = SerializedModel.create(object, serializer)
    end
  end
end