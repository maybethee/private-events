class AttendancesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @attendance = @event.attendances.build(attendee: current_user)
    if @attendance.save
      redirect_to @event, notice: 'See you there!'
    else
      redirect_to @event, alert: "We'll miss you!"
    end
  end

end
