class Api::V1::AssessmentsController < ApplicationController
	before_action :set_assessment, only: [:show, :update, :destroy]

	# GET /api/v1/assessments
	def index
	  @assessments = Assessment.all

	  render json: @assessments
	end

	# GET /api/v1/assessments/1
	def show
	  @include_notes = params[:include]
	  @assessments_notes = @assessment.notes
	  	if @include_notes == "notes"
		  respond_to do |format|
		      format.json { render :json => { :data =>
		          [{
		              :id => @assessment.id,
		              :type => "assessments",
		              :attributes =>  @assessment,
		              :relationships =>  {
		                  :assessments_notes => {
		                      :data => {
		                          :id => @assessments_notes.first.id,
		                          :type => "teams"
		                      }
		                  }
		              }
		          }]
		      },
		      :included => [
		        :id => @assessment.id,
		        :type => "assessments",
		        :attributes => @assessment
		      ]
		    }
		   end
		 else
		 	respond_to do |format|
		 	    format.json { render :json => { :data =>
		 	        [{
		 	            :id => @assessment.id,
		 	            :type => "assessments",
		 	            :attributes =>  @assessment,
		 	            :relationships =>  {
		 	                :assessments_notes => {
		 	                    :data => {
		 	                        :id => @assessments_notes.first.id,
		 	                        :type => "teams"
		 	                    }
		 	                }
		 	            }
		 	        }]
		 	    }
		 	  }
		 	 end
		 end
	end

	# POST /api/v1/assessments
	def create
	  @assessment = Assessment.new(assessment_params)

	  if @assessment.save
	    render json: @assessment, status: :created, location: @assessment
	  else
	    render json: @assessment.errors, status: :unprocessable_entity
	  end
	end

	# PATCH/PUT /api/v1/assessments/1
	def update
		@include_notes = params[:include]
		@assessments_notes = @assessment.notes
	  if @assessment.update(assessment_params)
	   	  	if @include_notes == "notes"
	   		  respond_to do |format|
	   		      format.json { render :json => { :data =>
	   		          [{
	   		              :id => @assessment.id,
	   		              :type => "assessments",
	   		              :attributes =>  @assessment,
	   		              :relationships =>  {
	   		                  :assessments_notes => {
	   		                      :data => {
	   		                          :id => @assessments_notes.id,
	   		                          :type => "teams"
	   		                      }
	   		                  }
	   		              }
	   		          }]
	   		      },
	   		      :included => [
	   		        :id => @assessments_notes.id,
	   		        :type => "assessments_notes",
	   		        :attributes => @assessment
	   		      ]
	   		    }
	   		   end
	   		 else
	   		 	respond_to do |format|
	   		 	    format.json { render :json => { :data =>
	   		 	        [{
	   		 	            :id => @assessment.id,
	   		 	            :type => "assessments",
	   		 	            :attributes =>  @assessment,
	   		 	            :relationships =>  {
	   		 	                :assessments_notes => {
	   		 	                    :data => {
	   		 	                        :id => @assessments_notes.id,
	   		 	                        :type => "teams"
	   		 	                    }
	   		 	                }
	   		 	            }
	   		 	        }]
	   		 	    }
	   		 	  }
	   		 	 end
	   		 end
	  else
	    render json: @assessment.errors, status: :unprocessable_entity
	  end
	end

	# DELETE /api/v1/assessments/1
	def destroy
	  @assessment.destroy
	  @assessment.notes.destroy_all
	  respond_to do |format|
	      format.json { render :json => { :data => { :message => "assessments and notes deleted"}
	      }
	    }
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_assessment
	    @assessment = Assessment.find(params[:id])
	  end

	  # Only allow a list of trusted parameters through.
	  def assessment_params
	    params.require(:assessment).permit(:rating, :assessment_type, :user_id, :tournament_id, :player_id)
	  end
end
