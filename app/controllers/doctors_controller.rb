class DoctorsController < ApplicationController
  def index
    redirect_to events_path if current_doctor
    @doctors = params[:speciality].present? ? Doctor.where(speciality: params[:speciality]) : Doctor.all
  end

  def show
    @doctor = Doctor.includes(:schedule).find(params[:id])
  end
end
