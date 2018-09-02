class ItemPresenter < ActiveModelPresenter::Model
  def self.show(item)
    new(item, {fields: [:name, :bar]})
  end
end