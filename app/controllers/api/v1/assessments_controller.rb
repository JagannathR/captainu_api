class Api::V1::AssessmentsController < ApplicationController
	before_action :set_assessment, only: [:show, :update, :destroy]

	# GET /api/v1/assessments
	def index
	  @assessments = Assessment.all

	  render json: @assessments
	end

	# GET /api/v1/assessments/1
	def show
	  render json: @assessment, include: ['player']
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
	  if @assessment.update(assessment_params)
	    render json: @assessment
	  else
	    render json: @assessment.errors, status: :unprocessable_entity
	  end
	end

	# DELETE /api/v1/assessments/1
	def destroy
	  @assessment.destroy
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
