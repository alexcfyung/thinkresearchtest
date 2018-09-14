class EncountersController < ApplicationController
	def index
	end
	
	def show
		@patient = Patient.find(params[:patient_id])
		@encounter = Encounter.find(params[:id])
	end

	def new
		@patient = Patient.find(params[:patient_id])
		@encounter = @patient.encounters.new
	end
	
	def edit
		@patient = Patient.find(params[:patient_id])
		@encounter = Encounter.find(params[:id])
	end
	
	def create
		@patient = Patient.find(params[:patient_id])
		@encounter = @patient.encounters.new(encounter_params)
		if @encounter.save
			redirect_to patient_encounter_path(@patient, @encounter)
		else
			render 'new'
		end
	end
	
	def update
		@patient = Patient.find(params[:patient_id])
		@encounter = Encounter.find(params[:id])
		if @encounter.update(encounter_params)
			redirect_to patient_encounter_path(@patient, @encounter)
		else
			render 'edit'
		end
	end
	
	def destroy
		@patient = Patient.find(params[:patient_id])
		@encounter = Encounter.find(params[:id])
		@encounter.destroy

		redirect_to patient_path(@patient)
	end

	private
		def encounter_params
			params.require(:encounter).permit(:visit_number, :admitted_at, :discharged_at, :location, :room, :bed)
		end
end
