class PostsController < ApplicationController
  def edit
    @post = Post.find(params[:id])
  end
end