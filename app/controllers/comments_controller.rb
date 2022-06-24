class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new(post_id: @post.id)
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    # new object from params
    @post = Post.find(params[:post_id])
    @comment = Comment.new(post_params)

    # respond_to block
    respond_to do |format|
      format.html do
        if @comment.save
          # success message
          flash[:success] = 'Comment created successfully'
          # redirect to index
          redirect_to user_post_url(id: post_params[:post_id])
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
    post_params[:post_id] = params.require(:post_id)
    post_params
  end
end
