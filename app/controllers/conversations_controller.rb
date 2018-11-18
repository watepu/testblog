class ConversationsController < ApplicationController

  def index
    @conversations = Conversations.all
  end
end
