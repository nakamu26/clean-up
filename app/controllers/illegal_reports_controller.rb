class IllegalReportsController < ApplicationController
  def new
    @illegal_report = IllegalReport.new
  end

  def create
    @illegal_report = IllegalReport.new(illegal_report_params)
    if @illegal_report.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def illegal_report_params
    params.require(:illegal_report).permit(:location_id, :point, :content, :comment, :image).merge(user_id: current_user.id)
  end
end
