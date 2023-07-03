class SpecialReportsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_special_report, only: [:show, :edit, :update]
  before_action :move_to_index, except: [:show, :new, :create]

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

  def edit
    render :new
  end

  def update
    params[:special_report][:image] = @special_report.image unless params[:special_report][:image]
    if @special_report.update(special_report_params)
      redirect_to special_report_path(@special_report.id)
    else
      render :new
    end
  end

  private

  def special_report_params
    params.require(:special_report).permit(:location_id, :category_id, :point, :comment, :image).merge(user_id: current_user.id)
  end

  def set_special_report
    @special_report = SpecialReport.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @special_report.user_id
  end
end
