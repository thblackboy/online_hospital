class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'URL not found' }
      format.json { head :not_found }
    end
  end
end
