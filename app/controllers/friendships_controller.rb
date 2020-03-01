class FriendshipsController < ApplicationController
  def create
  end

  def destory
    friendship = current_user.friendships.where(friend_id: params[:id])
    friendship.destroy
    flash[:notice] = "Stopped following"
    redirect_to my_friend_path
  end
end
