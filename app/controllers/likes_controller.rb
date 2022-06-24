class LikesController < ApplicationController
  def new
    @like = Like.new
    @user = current_user
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.html { render :new, locals: { like: @like, post: @post } }
    end
  end

  def create
    # new object from params
    @like = Like.new(post_params)
    @post = Post.find(params[:post_id])

    # respond_to block
    respond_to do |format|
      format.html do
        if @like.save
          # success message
          post = Post.find(post_params[:author_id])
          Like.update_post_likes_count(post)
          flash[:success] = 'Liked'
          # redirect to index
          redirect_to user_posts_url
        else
          flash.now[:error] = 'Error: Like could not be added'
          # render new
          render :new, locals: { like: @like, post: @post }
        end
      end
    end
  end

  private

  def post_params
    post_params = params.require(:like).permit(:text)
    post_params[:author_id] = current_user.id
    post_params[:post_id] = Post.find(params[:post_id])
    post_params
  end
end
