class Item
  def name
    'test'
  end

  # Rails Model
  def read_attribute_for_serialization(attr)
    send(attr)
  end
end