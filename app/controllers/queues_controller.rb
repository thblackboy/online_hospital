class QueuesController < ApplicationController
  def index
    @queue = params[:doctor_id].present? ? Doctor.find(params[:doctor_id]).events.active.today : []
  end
end
