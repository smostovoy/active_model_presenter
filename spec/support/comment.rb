class Comment < ActiveModelSerializers::Model
  def id
    1
  end

  def message
    'test'
  end
end