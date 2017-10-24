class PostSerializer < ActionSerializer::Base
  attributes :id, :title#, :content, :author_name

  # has_many :comments

  def author_name
    object.user.name
  end
end