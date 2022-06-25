class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
  end

  def new
    @post = Post.new
    @user = current_user
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    # new object from params
    @post = Post.new(post_params)

    # respond_to block
    respond_to do |format|
      format.html do
        if @post.save
          # success message
          flash[:success] = 'Post created successfully'
          # redirect to index
          redirect_to user_posts_url
        else
          flash.now[:error] = 'Error: Post could not be created'
          # render new
          render :new, locals: { post: @post }
        end
      end
    end
  end

  private

  def post_params
    post_params = params.require(:post).permit(:user_id, :title, :text)
    post_params[:author_id] = current_user.id
    post_params
  end
end
