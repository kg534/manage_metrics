class MenusController < ApplicationController
  before_action :set_groups, only: [:index, :group_display]
  before_action :set_tasks, only: [:index, :group_display]
  
  def index
    reports = current_user.reports.includes(:user).recent.where(active_date: Time.now.all_month)

    @charts = []
    reports.each do |report|
      @charts << [report.active_date, report.order]
    end
  end

  def group_display
    group = Group.find(params[:group_id])

    report = Report.all
    @users = group.users
    @latest_reports = []
    @users.each do |user|
      @latest_reports << Report.where(user_id: user.id).latest
    end
  end

  private 
  def set_groups
    @groups = current_user.groups
  end

  def set_tasks
    @today = Date.today
    tasks = current_user.tasks.includes(:user)
    @tasks_today = tasks.search_today.search_not_completed.recent
    @tasks_within = tasks.search_within.search_not_completed.recent
    @tasks_expired = tasks.search_expired.search_not_completed.recent
    @tasks_completed = tasks.search_completed.recent
  end
end
