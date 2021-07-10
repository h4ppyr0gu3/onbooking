class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ destroy ]

  def create
    @ticket = Ticket.new(ticket_params)

      if @ticket.save
        redirect_back(notice: "Ticket was successfully created.")
      else
        redirect_back(notice: @ticket.errors)
    end
  end

  def destroy
    @ticket.destroy
    redirect_back(notice: "Ticket was successfully deleted.")
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:title, :member_id, documents: [])
    end
end
