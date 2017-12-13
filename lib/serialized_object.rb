require 'active_model_serializers'
require 'hashie'

require 'serialized_object/base'
require 'serialized_object/model'
require 'serialized_object/collection'

module SerializedObject
  extend ActiveSupport::Concern

  included do
    if respond_to?(:hide_action)
      hide_action :serialize
    end
  end

  def serialize(object, serializer = nil)
    if object.is_a?(Array) || object.class.name == 'ActiveRecord::Relation'
      @coll = SerializedObject::Collection.new(object, serializer)
    else
      @item = SerializedObject::Model.create(object, serializer)
    end
  end
end