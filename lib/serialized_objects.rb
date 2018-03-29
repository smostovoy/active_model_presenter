require 'active_model_serializers'
require 'hashie'

require 'serialized_objects/base'
require 'serialized_objects/model'
require 'serialized_objects/collection'

module SerializedObjects
  extend ActiveSupport::Concern

  included do
    if respond_to?(:hide_action)
      hide_action :serialize
    end
  end

  def serialize(object, serializer = nil)
    if object.is_a?(Array) || object.class.name == 'ActiveRecord::Relation'
      @coll = SerializedObjects::Collection.new(object, serializer)
    else
      @item = SerializedObjects::Model.create(object, serializer)
    end
  end
end