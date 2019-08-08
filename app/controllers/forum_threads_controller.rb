class ForumThreadsController < ApplicationController
  def index
    @threads = ForumThread.all
  end
end
