class ProfilesController < ApplicationController

  before_action :authenticate_user!, except: :show
  before_action :set_user!

  def show; end

  def subscribe
    @friendship = current_user.friendships.new(friend_id: params[:id])
    if @friendship.save
      redirect_to profile_path(@user), notice: 'You have successfully subscribed!'
    else
      redirect_to profile_path(@user), alarm: 'Something went wrong!'
    end
  end

  private

  def set_user!
    @user = User.find(params[:id])
  end
end
