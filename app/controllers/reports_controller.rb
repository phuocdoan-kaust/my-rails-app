class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_general_report

  def index
    @reports = current_user.reports
  end

  private
    def set_general_report
      @time_of_reactivate = current_user.reports.where(report_type: "Re-activating Card").count
      @time_of_cancelling = current_user.reports.where(report_type: "Cancelling Card").count
    end
end
