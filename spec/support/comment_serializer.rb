class CommentSerializer < ActiveModel::Serializer
  attributes :id, :message, :author_name

  def author_name
    'author_name'
  end
end