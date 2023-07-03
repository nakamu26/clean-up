class SpecialReportsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_special_report, only: [:show]

  def new
    @special_report = SpecialReport.new
  end

  def create
    @special_report = SpecialReport.new(special_report_params)
    if @special_report.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def special_report_params
    params.require(:special_report).permit(:location_id, :category_id, :point, :comment, :image).merge(user_id: current_user.id)
  end

  def set_special_report
    @special_report = SpecialReport.find(params[:id])
  end
end
