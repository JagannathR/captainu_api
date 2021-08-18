class Api::V1::UsersController < ApplicationController
	before_action :set_user, only: [:show, :update, :destroy]

	# GET /api/v1/users
	def index
	  @users = User.all

	  render json: @users
	end

	# GET /api/v1/users/1
	def show
	  render json: @user
	end

	# POST /api/v1/users
	def create
	  @user = User.new(user_params)

	  if @user.save
	    render json: @user, status: :created, location: @user
	  else
	    render json: @user.errors, status: :unprocessable_entity
	  end
	end

	# PATCH/PUT /api/v1/users/1
	def update
	  if @user.update(user_params)
	    render json: @user
	  else
	    render json: @user.errors, status: :unprocessable_entity
	  end
	end

	# DELETE /api/v1/users/1
	def destroy
	  @user.destroy
	end

	# CONFIRM for user confirmation
	def confirm
	  token = params[:token].to_s

	  user = User.find_by(confirmation_token: token)

	  if user.present? && user.confirmation_token_valid?
	    user.mark_as_confirmed!
	    render json: {status: 'User confirmed successfully'}, status: :ok
	  else
	    render json: {status: 'Invalid token'}, status: :not_found
	  end
	end

	# LOGIN for webtoken authentication
	def login
	  user = User.find_by(email: params[:email].to_s.downcase)

	  if user && user.authenticate(params[:password])
	      auth_token = JsonWebToken.encode({user_id: user.id})
	      render json: {auth_token: auth_token}, status: :ok
	  else
	    render json: {error: 'Invalid username / password'}, status: :unauthorized
	  end
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_user
	    @user = User.find(params[:id])
	  end

	  # Only allow a list of trusted parameters through.
	  def user_params
	    params.require(:user).permit(:email, :password)
	  end
end
