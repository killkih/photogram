class ProfilesController < ApplicationController

  before_action :authenticate_user!, except: :show
  before_action :set_user!

  def show; end

  def subscribe
    @friendship = current_user.friendships.new(friend_id: @user.id)
    if @friendship.save
      redirect_to profile_path(@user), notice: 'You have subscribed!'
    else
      redirect_to profile_path(@user), alarm: 'Something went wrong!'
    end
  end

  def unsubscribe
    @friendship = Friendship.find_by(user_id: current_user.id, friend_id: @user.id)
    if @friendship.destroy
      redirect_to friends_path, notice: 'You have unsubscribed!'
    end
  end

  private

  def set_user!
    @user = User.find(params[:id])
  end
end
