class NormalReportsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @normal_reports = NormalReport.where("created_at >= ?", Date.today).includes(:user).order("created_at DESC")
  end

  def new
    @normal_report = NormalReport.new
  end

  def create
    @normal_report = NormalReport.new(normal_report_params)
    if @normal_report.save
      render :create
    else
      render :new
    end
  end

  private

  def normal_report_params
    params.require(:normal_report).permit(:location_id, :number_of_times_id, :point, :image).merge(user_id: current_user.id)
  end
end
