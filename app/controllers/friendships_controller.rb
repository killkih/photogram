class FriendshipsController < ApplicationController

  before_action :authenticate_user!

  def index
    @friendships = current_user.friendships
  end
end
