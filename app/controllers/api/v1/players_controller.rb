class Api::V1::PlayersController < ApplicationController
	before_action :set_player, only: [:show, :update, :destroy, :player_assessments]

	# GET /api/v1/players
	def index
	  @players = Player.all

	  respond_to do |format|
		  	format.json { render :json => { :data => 
			  	[{ 
			  		:id => @players.first.id,
			  		:type => "players",
			  		:attributes =>  @players,
			  	}]
			  	}
				}
		end 
	end

	# GET /api/v1/players/1
	def show
		@include_assessments = params[:assessments]
		@include_assessments_notes = params[:assessments_notes]


		@player_assessments = @player.assessments
		@player_assessments_notes = @player.assessments

		if @include_assessments
			respond_to do |format|
			  	format.json { render :json => { :data => 
				  	[{ 
				  		:id => @player.id,
				  		:type => "players",
				  		:attributes =>  @player,
				  		:relationships => @player_assessments
				  	}]
				  	}, :included => [@player_assessments]
					}
			end
		else
			respond_to do |format|
			  	format.json { render :json => { :data => 
				  	[{ 
				  		:id => @player.id,
				  		:type => "players",
				  		:attributes =>  @player,
				  		:relationships => @player_assessments
				  	}]
				  	}, :included => [@player_assessments]
					}
			end
		else
			respond_to do |format|
			  	format.json { render :json => { :data => 
				  	[{ 
				  		:id => @player.id,
				  		:type => "players",
				  		:attributes =>  @player,
				  		:relationships => @player_assessments
				  	}]
				  	}
					}
			end
		end
	end

	# GET /api/v1/players/1/assessments
	def player_assessments
		@user_player_assessments = Assessment.where(player_id: @player.id)
	  	respond_to do |format|
	  	  	format.json { render :json => { :data => 
	  		  	[{ 
	  		  		:id => @player.id,
	  		  		:type => "players",
	  		  		:attributes =>  @player,
	  		  		:relationships => @user_player_assessments
	  		  	}]
	  		  	}, :included => [@user_player_assessments]
	  			}
	  	end
	end

	# POST /api/v1/players
	def create
	  @player = Player.new(player_params)

	  if @player.save
	    render json: @player, status: :created, location: @player
	  else
	    render json: @player.errors, status: :unprocessable_entity
	  end
	end

	# PATCH/PUT /api/v1/players/1
	def update
	  if @player.update(player_params)
	    render json: @player
	  else
	    render json: @player.errors, status: :unprocessable_entity
	  end
	end

	# DELETE /api/v1/players/1
	def destroy
	  @player.destroy
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_player
	    @player = Player.find(params[:id])
	  end

	  # Only allow a list of trusted parameters through.
	  def player_params
	    params.require(:player).permit(:first_name, :last_name, :height, :weight, :birthday, :graduation_year, :position, :recruit)
	  end
end
