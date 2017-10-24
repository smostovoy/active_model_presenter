class CommentSerializer < ActionSerializer::Base
  attributes :id, :message, :author_name

  def author_name
    object.user.name
  end
end