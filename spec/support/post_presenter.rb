class PostPresenter < ActiveModelPresenter::Base
  def self.show(post)
    present(post, [:name, :bar])
  end

  def self.list(posts)
    present(posts, [:name, :bar]) do |result, model|
      result.comments = present(model.comments, [:message])
    end
  end
end