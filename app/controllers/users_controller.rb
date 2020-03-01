class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end
  def my_friends
    @friends = current_user.friends
  end
  def search
    if params[:friend].present?
      @friend = params[:friend]
      if @friend
        respond_to do |fm|
          fm.js {render partial: 'users/friend_result'}
        end
      else
        respond_to do |fm|
          flash.now[:alert] = "Couldn't find user"
          fm.js {render partial: 'users/friend_result'}
        end
      end
    else
      respond_to do |fm|
        flash.now[:alert] = "Please enter a friend to name or email to search"
        fm.js {render partial: 'users/friend_result'}
      end
    end
  end
end
