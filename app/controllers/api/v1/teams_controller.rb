class Api::V1::TeamsController < ApplicationController
	before_action :set_team, only: [:show, :update, :destroy]

	# GET /api/v1/teams
	def index
	  @teams = Team.all

	  render json: @teams
	end

	# GET /api/v1/teams/1
	def show
		# render json: @team
		@include_players = params[:players]

	  	@players = Player.all

	  	if @include_players
			respond_to do |format|
			  	format.json { render :json => { :data => 
				  	[{ 
				  		:id => @team.id,
				  		:type => "teams",
				  		:attributes => [ :name => @team.name, :age_group => @team.age_group ],
				  		:relationships => [ :players => @players ]
				  		# :relationships => [ :players => [ @players.each do |p| :id => p.id, :type => "players" end ] ]
				  	}]
				  	}
					}
			end
		else
			respond_to do |format|
			  	format.json { render :json => { :data => 
				  	[{ 
				  		:id => @team.id,
				  		:type => "teams",
				  		:attributes => [ :name => @team.name, :age_group => @team.age_group ],
				  		:relationships => [ :players => @players ]
				  		# :relationships => [ :players => [ @players.each do |p| :id => p.id, :type => "players" end ] ]
				  	}]
				  	# }, :included => [ @players.each do |p| :id => p.id, :type => "players", :attributes => p end ]
				  	}, :included =>  @players
					}
			end
		end
	end

	# POST /api/v1/teams
	def create
	  @team = Team.new(team_params)

	  if @team.save
	    render json: @team, status: :created, location: @team
	  else
	    render json: @team.errors, status: :unprocessable_entity
	  end
	end

	# PATCH/PUT /api/v1/teams/1
	def update
	  if @team.update(team_params)
	    render json: @team
	  else
	    render json: @team.errors, status: :unprocessable_entity
	  end
	end

	# DELETE /api/v1/teams/1
	def destroy
	  @team.destroy
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_team
	    @team = Team.find(params[:id])
	  end

	  # Only allow a list of trusted parameters through.
	  def team_params
	    params.require(:team).permit(:name, :age_group, :coach)
	  end
end
