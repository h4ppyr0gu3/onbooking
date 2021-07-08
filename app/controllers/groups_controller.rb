class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @groups = current_user.groups
  end

  def show
    @members = @group.members
    @ticket = Ticket.new
  end

  def new
    @group = Group.new
  end

  def edit
    @members = @group.members
    @member = Member.new
  end

  def create
    @group = current_user.groups.new(group_params)

    if @group.save
      redirect_to root_path, notice: "Group was successfully created."
    else
      redirect_to root_path, notice: @group.errors
    end
  end

  def update
    if @group.update(group_params)
      redirect_to root_path, notice: "Group was successfully updated."
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @group.destroy
      redirect_to root_path, notice: "Group was successfully destroyed."
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
