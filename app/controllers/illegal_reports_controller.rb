class IllegalReportsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_illegal_report, only: [:show]

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

  def show
  end

  private

  def illegal_report_params
    params.require(:illegal_report).permit(:location_id, :point, :content, :comment, :image).merge(user_id: current_user.id)
  end

  def set_illegal_report
    @illegal_report = IllegalReport.find(params[:id])
  end
end
