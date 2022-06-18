class PostsController < ApplicationController
  def index
    @user_posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.where(author_id: params[:user_id]).find(params[:id])
  end
end
