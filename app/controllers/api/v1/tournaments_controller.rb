class Api::V1::TournamentsController < ApplicationController
	before_action :set_tournament, only: [:show, :update, :destroy]

	# GET /api/v1/tournaments
	def index
	  @tournaments = Tournament.all

	  render json: @tournaments
	end

	# GET /api/v1/tournaments/1
	def show
	  render json: @tournament
	end

	# POST /api/v1/tournaments
	def create
	  @tournament = Tournament.new(tournament_params)

	  if @tournament.save
	    render json: @tournament, status: :created, location: @tournament
	  else
	    render json: @tournament.errors, status: :unprocessable_entity
	  end
	end

	# PATCH/PUT /api/v1/tournaments/1
	def update
	  if @tournament.update(tournament_params)
	    render json: @tournament
	  else
	    render json: @tournament.errors, status: :unprocessable_entity
	  end
	end

	# DELETE /api/v1/tournaments/1
	def destroy
	  @tournament.destroy
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_tournament
	    @tournament = Tournament.find(params[:id])
	  end

	  # Only allow a list of trusted parameters through.
	  def tournament_params
	    params.require(:tournament).permit(:name, :city, :state, :start_date)
	  end
end
