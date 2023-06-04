class DoctorsController < ApplicationController
  def index
    @doctors = params[:speciality].present? ? Doctor.where(speciality: params[:speciality]) : Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end
end
