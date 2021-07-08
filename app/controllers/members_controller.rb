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
      redirect_to request.env["HTTP_REFERER"], notice: "Created successfully"
    else
      redirect_to request.env["HTTP_REFERER"], notice: @member.errors 
    end
  end

  def update
    if @member.update(member_params)
      redirect_to request.env["HTTP_REFERER"], notice: "Member was successfully updated." 
    else
      redirect_to request.env["HTTP_REFERER"], notice: @member.errors 
    end
  end

  def destroy
    @member.destroy
    redirect_to request.env["HTTP_REFERER"]
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:name, :group_id)
  end
end
