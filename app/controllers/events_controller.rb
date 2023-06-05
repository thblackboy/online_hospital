class EventsController < ApplicationController
  before_action :authenticate_client!, only: %i[new create]
  before_action :find_doctor, only: :new
  before_action :check_possibility, only: :new
  before_action :check_user, only: %i[index done cancel show]
  before_action :find_event, only: %i[done cancel show]

  def index
    @events = @user.is_a?(Doctor) ? @user.events.active.today : @user.events
  end

  def show; end

  def done
    @event.update({ is_done: true })

    redirect_to events_path, notice: 'Прием окончен'
  end

  def cancel
    @event.update({ is_canceled: true })

    redirect_to events_path, notice: 'Запись отменена'
  end

  def new
    @event = current_client.events.build(doctor_id: @doctor.id)
  end

  def create
    @event = current_client.events.build(event_params)
    if @event.save
      redirect_to root_path, notice: 'Запись успешно создана'
    else
      @doctor = @event.doctor
      render :new, status: :unprocessable_entity
    end
  end

  def event_params
    params.require(:event).permit(:doctor_id, :start_time)
  end

  private

  def find_event
    @event = @user.events.find(params[:id])
  end

  def check_user
    @user = current_client || current_doctor
    redirect_to root_path, notice: 'Необходимо войти в систему' unless @user
  end

  def find_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def check_possibility
    return unless current_client.events.active.where(doctor_id: @doctor.id).any?

    redirect_to root_path, notice: 'У вас уже есть запись к этому врачу'
  end
end
