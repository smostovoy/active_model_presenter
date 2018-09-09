class PostSerializer < ActiveModel::Serializer
  attributes :name, :bar

  def bar
    'bar value'
  end
end