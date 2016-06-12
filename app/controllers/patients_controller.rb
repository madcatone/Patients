class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  around_filter :hypernova_render_support

  # GET /patients
  def index
    @patients = Patient.active.includes(:location)
  end

  # GET /patients/1
  def show
    @patient.view_count += 1
    @patient.save
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patient
  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to patients_path, notice: 'My patient was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /patients/1
  def update
    if @patient.update(patient_params)
      redirect_to @patient, notice: 'My patient was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /patients/1
  def destroy
    #@patient.destroy#改寫destroy
    @patient.deletion = true
    @patient.save
    redirect_to patient_url, notice: 'My patient was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def patient_params
      params.require(:patient)
        .permit(:first_name, :last_name, :middle_name,
          :birth_at, :medical_record_no, :gender,
          :status, :location_id, :view_count, :deletion
        )
    end
end
