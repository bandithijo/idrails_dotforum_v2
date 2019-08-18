class ForumThreadsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @threads = ForumThread.order(id: :desc)
  end

  def show
    @thread = ForumThread.find(params[:id])
    @post = ForumPost.new
  end

  def new
    @thread = ForumThread.new
  end

  def create
    @thread = ForumThread.new(resource_params)
    @thread.user = current_user
    if @thread.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def resource_params
    params.require(:forum_thread).permit(:title, :content)
  end
end
