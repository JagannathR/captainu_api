class Api::V1::NotesController < ApplicationController
	before_action :set_note, only: [:show, :update, :destroy]

	# GET /api/v1/notes
	def index
	  @notes = Note.all

	  render json: @notes
	end

	# GET /api/v1/notes/1
	def show
	  render json: @note
	end

	# POST /api/v1/notes
	def create
	  @note = Note.new(note_params)

	  if @note.save
	    respond_to do |format|
	        format.json { render :json => { :data =>
	            [{
	                :type => "assessment_notes",
	                :attributes =>  @note,
	                
	            }]
	        }
	      }
	     end
	  else
	    render json: @note.errors, status: :unprocessable_entity
	  end
	end

	# PATCH/PUT /api/v1/notes/1
	def update
	  if @note.update(note_params)
	    respond_to do |format|
	        format.json { render :json => { :data =>
	            [{
	                :type => "assessment_notes",
	                :attributes =>  @note,
	                
	            }]
	        }
	      }
	     end
	  else
	    render json: @note.errors, status: :unprocessable_entity
	  end
	end

	# DELETE /api/v1/notes/1
	def destroy
	  @note.destroy
	  respond_to do |format|
	      format.json { render :json => { :data => { :message => "assessments note deleted"}
	      }
	    }
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_note
	    @note = Note.find(params[:id])
	  end

	  # Only allow a list of trusted parameters through.
	  def note_params
	    params.require(:note).permit(:note, :user_id, :assessment_id)
	  end
end
