class NormalReportsController < ApplicationController

  def index
  end

  def new
    @normal_report = NormalReport.new
  end
end
