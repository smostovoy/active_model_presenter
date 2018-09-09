class PostSerializer < ActiveModel::Serializer
  attributes :name, :bar, :instance_options_check

  def bar
    'bar value'
  end

  def instance_options_check
    instance_options
  end
end