class ChatroomsController < ApplicationController
   def show
    @chatrooms = Chatroom.includes(:portfolio).where(user: current_user).or(Chatroom.includes(:portfolio).where(portfolio: {user: current_user}))
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
    @message = Message.new
  end

end
