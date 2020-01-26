class CalendarsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def group_display
    @groups = current_user.groups
    group = Group.find(params[:group_id])
    @users = group.users
  end

  def show
    @user = User.find(params[:id])
    @tasks = current_user.tasks.includes(:user);
  end
end
