require 'active_model_serializers'
require 'hashie'

require 'action_serializer/base'
require 'action_serializer/model'
require 'action_serializer/collection'

module ActionSerializer
  extend ActiveSupport::Concern

  included do
    if respond_to?(:hide_action)
      hide_action :serialize
    end
  end

  def serialize(object, serializer = nil)
    if object.is_a?(Array) || object.class.name == 'ActiveRecord::Relation'
      @coll = ActionSerializer::Collection.new(object, serializer)
    else
      @item = ActionSerializer::Model.create(object, serializer)
    end
  end
end