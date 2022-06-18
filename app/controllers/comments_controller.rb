class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = current_user
    @post = Post.first
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    # new object from params
    @comment = Comment.new(post_params)

    # respond_to block
    respond_to do |format|
      format.html do
        if @comment.save
          # success message
          post = Post.find(post_params[:author_id])
          Comment.update_post_comments_count(post)
          flash[:success] = 'Comment created successfully'
          # redirect to index
          redirect_to user_posts_url
        else
          flash.now[:error] = 'Error: Comment could not be created'
          # render new
          render :new, locals: { comment: @comment }
        end
      end
    end
  end

  private

  def post_params
    post_params = params.require(:comment).permit(:text)
    post_params[:author_id] = current_user.id
    post_params[:post_id] = Post.first.id
    post_params
  end
end
