class Post < ActiveModelSerializers::Model
  def name
    'test'
  end

  def comments
    [Comment.new]
  end
end