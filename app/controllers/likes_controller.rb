class LikesController < ApplicationController
  def def(_new)
    @like = Like.new
  end

  def create
    # new object from params
    Like.create(author_id: current_user.id, post_id: params[:post_id])
    redirect_to user_post_url(id: params[:post_id])
  end
end
