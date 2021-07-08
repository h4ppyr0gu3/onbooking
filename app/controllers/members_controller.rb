class MembersController < ApplicationController
  before_action :set_member, only: %i[3 update destroy ]
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[ show ]

  def show
    @member = Member.find_by(uuid: params[:uuid])
    @tickets = @member.tickets
  end

  def create
    @member = Member.new(member_params)
    @member.uuid = SecureRandom.uuid
    if @member.save
      redirect_back(notice: "Member created")      
    else
      redirect_back(notice: @member.errors)
    end
  end

  def update
    if @member.update(member_params)
      redirect_back(notice: "Member updated")      
    else
      redirect_back(notice: @member.errors)
    end
  end

  def destroy
    @member.destroy
    redirect_back(notice: "Member deleted")      
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:name, :group_id)
  end
end
