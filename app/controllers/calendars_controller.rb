class CalendarsController < ApplicationController
  def index
    @tasks = current_user.tasks.includes(:user).where('end_time >= ?', Date.today)
  end
end
