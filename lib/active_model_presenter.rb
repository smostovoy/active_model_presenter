require 'active_model_serializers'
require 'hashie'

require 'active_model_presenter/model'
require 'active_model_presenter/collection'

module ActiveModelPresenter
  extend ActiveSupport::Concern

  included do
    if respond_to?(:hide_action)
      hide_action :present
    end
  end

  def present(object, serializer = nil)
    if object.is_a?(Array) || object.class.name == 'ActiveRecord::Relation'
      @coll = ActiveModelPresenter::Collection.new(object, serializer)
    else
      @item = ActiveModelPresenter::Model.new(object, serializer)
    end
  end
end