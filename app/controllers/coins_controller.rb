class CoinsController < ApplicationController
  before_action :authorized
  before_action :set_coin, only: :show
  
  # GET /api/v1/coins
  def index
    @coins = Coin.all.page params[:page]
    paginate json: @coins
  end

  # GET /api/v1/coins/:id
  def show
    render json: @coin
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin
      @coin = Coin.find_by_asset_id(params[:id])
    end
end
