class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |fm|
          fm.js {render partial: 'users/result'}
        end
      else
        flash.now[:alert] = "Please enter a valid symbol to search"
        respond_to do |fm|
          fm.js {render partial: 'users/result'}
        end
      end
    else
      flash.now[:alert] = "Please enter a symbol to search"
      respond_to do |fm|
        fm.js {render partial: 'users/result'}
      end
    end
  end
  def chart
    if params[:stock].present?
      @stock = Stock.chart(params[:stock])
      if @stock
        render json: @stock
      else
        flash[:alert] = "Please enter a valid symbol to search"
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = "Please enter a symbol to search"
      redirect_to my_portfolio_path
    end

  end
end