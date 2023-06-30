class NormalReportsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  def index
  end

  def new
    @normal_report = NormalReport.new
  end

  def create
    @normal_report = NormalReport.new(normal_report_params)
    if @normal_report.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def normal_report_params
    params.require(:normal_report).permit(:location_id, :number_of_times_id, :point, :image).merge(user_id: current_user.id)
  end
end
