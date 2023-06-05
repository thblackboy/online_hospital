class ReportsController < ApplicationController
  before_action :authenticate_client!, only: %i[new create]
  before_action :check_user, only: %i[index]
  before_action :find_event, only: :new

  before_action :check_possibility, only: :new

  def index
    @reports = @user.reports
  end

  def new
    @report = current_client.reports.build(event_id: @event.id)
  end

  def create
    @report = current_client.reports.build(report_params)
    if @report.save
      redirect_to events_path, notice: 'Отзыв успешно создан'
    else
      @event = @report.event
      render :new, status: :unprocessable_entity
    end
  end

  def report_params
    params.require(:report).permit(:event_id, :note, :comment)
  end

  private

  def find_event
    @event = current_client.events.find(params[:event_id])
  end

  def check_user
    @user = current_client || current_doctor
    redirect_to root_path, notice: 'Необходимо войти в систему' unless @user
  end

  def check_possibility
    return if @event.can_do_report?

    redirect_to root_path, notice: 'У вас уже есть запись к этому врачу'
  end
end
