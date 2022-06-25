class LikesController < ApplicationController
  def create
    # new object from params
    @like = Like.new(post_params)

    if @like.save
      # success message
      flash[:success] = 'Liked'
      # redirect to index
      redirect_to user_post_url(id: post_params[:post_id])
    else
      flash.now[:error] = 'Error: Like could not be added'
    end
  end

  private

  def post_params
    post_params[:author_id] = current_user.id
    post_params[:post_id] = params.require(:post_id)
    post_params
  end
end
