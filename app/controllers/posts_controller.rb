class PostsController < ApplicationController
  def index
    @user_posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.where(author_id: params[:user_id]).find(params[:id])
  end

  def new
    post = Post.new
    respond_to do |format|
    format.html { render :new, locals: { post: post } }
    end
  end

  def create; end
end
