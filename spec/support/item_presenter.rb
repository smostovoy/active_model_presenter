class ItemPresenter < ActiveModelPresenter::Base
  def self.show(item)
    present(item, {fields: [:name, :bar]})
  end

  def self.list(items)
    present(items, {fields: [:name, :bar]})
  end
end