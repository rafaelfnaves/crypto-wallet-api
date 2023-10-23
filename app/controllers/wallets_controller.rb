class WalletsController < ApplicationController
  before_action :authorized
  before_action :set_wallet, only: [:show, :edit, :update, :destroy]

  # POST /wallets
  def create
    coins = params['coins'].map{ |i| Coin.find_by_asset_id(i) }
    @wallet = Wallet.create(
      description: params['description'],
      user_id: params['user_id'],
      coins: coins
    )

    if @wallet.save
      render json: {wallet: @wallet, coins: @wallet.coins}, status: :created
    else
      render json: @wallet.errors, status: :unprocessable_entity
    end
  end

  # GET /wallets/:id
  def show
    render json: {wallet: @wallet, coins: @wallet.coins}
  end

  # GET /wallets/:id/edit
  def edit
  end

  # PATCH/PUT /wallets/:id
  def update
    coins = params['coins'].map{ |i| Coin.find_by_asset_id(i) } if params['coins'].present?
    if @wallet.update(description: params['description'], coins: coins)
      render json: {wallet: @wallet, coins: @wallet.coins}
    else
      render json: @wallet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wallets/:id
  def destroy
    @wallet.destroy
    render json: {'message': 'Deleted wallet'}    
  end

  private

  # Define o método para permitir parâmetros específicos para criação/atualização de uma carteira
  def wallet_params
    params.require(:wallet).permit(:description, :user_id, coins: [])  # coins permite selecionar moedas associadas
  end

  # Define o método para configurar a variável @wallet com base no ID da carteira fornecido na rota
  def set_wallet
    @wallet = Wallet.find(params[:id])
  end
end
