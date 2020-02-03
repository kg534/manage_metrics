class ReportsController < ApplicationController
  before_action :set_params, only: [:edit, :show, :update, :destroy]

  def index
    @reports = current_user.reports.includes(:user).recent.where(active_date: Time.now.all_month)

    @chart = []
    @reports.each do |report|
      @chart << [report.active_date, report.order]
    end

    respond_to do |format|
      format.html
      format.csv { send_data @reports.generate_csv, filename: "reports-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
  end

  def import
    if params[:file] != nil
      current_user.reports.import(params[:file])
      redirect_to reports_path
    else
      redirect_to reports_path
    end
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to reports_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @report.update(report_params)
    redirect_to reports_path
  end

  def destroy
    @report.destroy
    redirect_to reports_path
  end

  private
  def report_params
    params.require(:report).permit(:active_date, :order, :phone, :visit, :negotiate, :good_thing, :problem, :goal).merge(user_id: current_user.id)
  end

  def set_params
    @report = current_user.reports.find(params[:id])
  end
end
