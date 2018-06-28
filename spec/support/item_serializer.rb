class ItemSerializer < ActiveModelPresenter::Base
  attributes :name, :bar

  def bar
    'bar value'
  end
end