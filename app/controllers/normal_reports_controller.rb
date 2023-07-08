class NormalReportsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_normal_report, only: [:show, :edit, :update]
  before_action :move_to_index, except: [:index, :show, :new, :create]

  def index
    @normal_reports = NormalReport.where("created_at >= ?", Date.today).includes(:user).order("created_at DESC")
    @special_reports = SpecialReport.where("created_at >= ?", Date.today).includes(:user).order("created_at DESC")
    @illegal_reports = IllegalReport.where("created_at >= ?", Date.today).includes(:user).order("created_at DESC")
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

  def show
    @check_normal_report = CheckNormalReport.new
  end

  def edit
    render :new
  end

  def update
    params[:normal_report][:image] = @normal_report.image unless params[:normal_report][:image]
    if @normal_report.update(normal_report_params)
      redirect_to normal_report_path(@normal_report.id)
    else
      render :new
    end
  end

  private

  def normal_report_params
    params.require(:normal_report).permit(:location_id, :number_of_times_id, :point, :image).merge(user_id: current_user.id)
  end

  def set_normal_report
    @normal_report = NormalReport.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @normal_report.user_id
  end
end
