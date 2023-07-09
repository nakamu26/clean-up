class CheckNormalReportsController < ApplicationController
  def create
    @normal_report = NormalReport.find(params[:normal_report_id])
    @check_normal_report = @normal_report.check_normal_reports.new(check_normal_report_params)
    @check_normal_report.save
  end

  private

  def check_normal_report_params
    params.require(:normal_report).permit(:user_id)
  end
end
