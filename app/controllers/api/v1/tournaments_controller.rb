class Api::V1::TournamentsController < ApplicationController
    before_action :set_tournament, only: [:show, :update, :destroy]

    # GET /api/v1/tournaments
    def index
      @tournaments = Tournament.all
      @teams = Team.first
      @players = Player.first

        respond_to do |format|
            format.json { render :json => { :data =>
                [{
                    :id => @tournaments.first.id,
                    :type => "tournaments",
                    :attributes =>  @tournaments,
                    :relationships =>  {
                        :teams => {
                            :data => {
                                :id => @teams.id,
                                :type => "teams"
                            }
                        },
                        :players => {
                            :data => {
                                :id => @players.id,
                                :type => "players"
                            }
                        },
                    }
                }]
            }
            }
        end
    end

    # GET /api/v1/tournaments/1
    def show
      @include_team_players = params[:include]
      @teams = Team.first
      @players = Player.first

        if include_team_players == "players_teams"
          respond_to do |format|
              format.json { render :json => { :data =>
                  [{
                      :id => @tournaments.first.id,
                      :type => "tournaments",
                      :attributes =>  @tournament,
                      :relationships =>  {
                          :teams => {
                              :data => {
                                  :id => @teams.id,
                                  :type => "teams"
                              }
                          },
                          :players => {
                              :data => {
                                  :id => @players.id,
                                  :type => "players"
                              }
                          },
                      }
                  }]
              }
              :included [
                :id => @teams.id,
                :type => "teams",
                :attributes => {
                  :name => @teams.name,
                  :age_group => @teams.age_group
                },
                :relationships => {
                  :players => {
                    :data => @players
                  }
                }
              ]
              }
          end
        elsif if include_team_players == "teams"
          respond_to do |format|
              format.json { render :json => { :data =>
                  [{
                      :id => @tournament.first.id,
                      :type => "tournaments",
                      :attributes =>  @tournament,
                      :relationships =>  {
                          :teams => {
                              :data => {
                                  :id => @teams.id,
                                  :type => "teams"
                              }
                          },
                          :players => {
                              :data => {
                                  :id => @players.id,
                                  :type => "players"
                              }
                          },
                      }
                  }]
              }
              }
          end
        else
          respond_to do |format|
              format.json { render :json => { :data =>
                  [{
                      :id => @tournament.first.id,
                      :type => "tournaments",
                      :attributes =>  @tournament,
                      :relationships =>  {
                          :teams => {
                              :data => {
                                  :id => @teams.id,
                                  :type => "teams"
                              }
                          },
                          :players => {
                              :data => {
                                  :id => @players.id,
                                  :type => "players"
                              }
                          },
                      }
                  }]
              }
              }
          end
        end

    end

    # GET /api/v1/tournaments/1/events
    def tournament_events
      @tournaments = Tournament.all
      @teams = Team.first
      @players = Player.first

        respond_to do |format|
            format.json { render :json => { :data =>
                [{
                    :id => @tournaments.first.id,
                    :type => "tournaments",
                    :attributes =>  @tournaments,
                    :relationships =>  {
                        :teams => {
                            :data => {
                                :id => @teams.id,
                                :type => "teams"
                            }
                        },
                        :players => {
                            :data => {
                                :id => @players.id,
                                :type => "players"
                            }
                        },
                    }
                }]
            }
            }
        end
    end

    # GET /api/v1/tournaments/1/teams
    def tournament_teams
      @tournaments = Tournament.all
      @teams = Team.first
      @players = Player.first

        respond_to do |format|
            format.json { render :json => { :data =>
                [{
                    :id => @tournaments.first.id,
                    :type => "tournaments",
                    :attributes =>  @tournaments,
                    :relationships =>  {
                        :players => {
                            :data => {
                                :id => @players.id,
                                :type => "players"
                            }
                        },
                    }
                }],
                :included [
                  :id => @teams.id,
                  :type => "teams",
                  :attributes => {
                    :players => {
                      :data => @players
                    } 
                  }
                ]
              }
            }
            }
        end
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
