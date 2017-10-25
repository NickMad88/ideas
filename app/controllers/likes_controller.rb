class LikesController < ApplicationController

  def create
    Like.create (like_helper)
    redirect_to ideas_path
  end

  private
    def like_helper
      params.require(:like).permit(:idea_id).merge(user: current_user)
    end
end
