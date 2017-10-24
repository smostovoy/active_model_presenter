class PostsController < ApplicationController
  include ActionSerializer

  def show
    @post = serialize(Post.find(params[:id]))
  end
end