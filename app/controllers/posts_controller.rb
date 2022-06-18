class PostsController < ApplicationController
  def index
    @user_posts = Post.where(author_id: params[:user_id]).order(created_at: :desc)
  end

  def show
    @post = Post.where(author_id: params[:user_id]).find(params[:id])
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
          user = User.find(post_params[:author_id])
          Post.update_user_posts_count(user)
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
