class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def show
    @idea = Idea.find(params[:id])
    @like = @idea.likes
  end

  def create
    @idea = Idea.new (idea_helper)
    unless @idea.save
      flash[:errors] = @idea.errors.full_messages
    end
    redirect_to ideas_path
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to ideas_path
  end

  private
  def idea_helper
    params.require(:idea).permit(:content).merge(user:current_user) if params[:idea].present?
  end

end
