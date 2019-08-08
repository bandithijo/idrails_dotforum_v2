class ForumThreadsController < ApplicationController
  def index
    @threads = ForumThread.all
  end

  def show
    @thread = ForumThread.find(params[:id])
  end
end
