class CheckNormalReportsController < ApplicationController
  def create
    @check_normal_report = CheckNormalReport.new(illegal_report_params)
    @check_normal_report.save
  end

  private

  def illegal_report_params
    params.require(:normal_report_id).merge(user_id: current_user.id)
  end
end
