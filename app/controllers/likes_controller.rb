class LikesController < ApplicationController
  def def(_new)
    @like = Like.new
  end

  def create
    # new object from params
    @like = Like.new(author_id: current_user.id, post_id: params[:post_id])

    if @like.save
      flash[:success] = 'Liked'
      redirect_to user_post_url(id: params[:post_id])
    else
      flash.now[:error] = 'Like was not added'
    end
  end
end
