class IllegalReportsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_illegal_report, only: [:show, :edit, :update]

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

  def edit
    render :new
  end

  def update
    params[:illegal_report][:image] = @illegal_report.image unless params[:illegal_report][:image]
    if @illegal_report.update(illegal_report_params)
      redirect_to illegal_report_path(@illegal_report.id)
    else
      render :new
    end
  end

  private

  def illegal_report_params
    params.require(:illegal_report).permit(:location_id, :point, :content, :comment, :image).merge(user_id: current_user.id)
  end

  def set_illegal_report
    @illegal_report = IllegalReport.find(params[:id])
  end
end
