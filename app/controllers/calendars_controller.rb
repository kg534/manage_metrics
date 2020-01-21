class CalendarsController < ApplicationController
  before_action :set_task_schedule, only: [:index, :show]
  
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def set_task_schedule
    @tasks = current_user.tasks.includes(:user)
  end
end
