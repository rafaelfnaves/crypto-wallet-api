class CoinsController < ApplicationController
  before_action :authorized
  before_action :set_coin, only: [:show, :periods]
  
  # GET /api/v1/coins
  def index
    @coins = Coin.all.page params[:page]
    paginate json: @coins
  end

  # GET /api/v1/coins/:id
  def show
    render json: @coin
  end

  def periods
    begin
      @periods = Coin.get_periods(@coin.asset_id, params[:period])
      render json: @periods, status: :ok
    rescue Exception => error
      render json: { error: "Failed request: #{error.message}" }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin
      @coin = Coin.find_by_asset_id(params[:id])
    end
end
