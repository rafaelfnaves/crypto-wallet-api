class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}, status: :created
    else
      render json: {error: "Invalid username or password"}
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      wallets = Wallet.where(user_id: @user.id)
      render json: {user: @user, token: token, wallets: wallets}
    else
      render json: {error: "Invalid username or password"}
    end
  end


  def auto_login
    wallets = Wallet.where(user_id: @user.id)
    render json: {user: @user, wallets: wallets}
  end

  private

  def user_params
    params.permit(:username, :password, :name)
  end
end
