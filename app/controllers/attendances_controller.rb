class AttendancesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @attendance = @event.attendances.build(attendee: current_user)
    if @attendance.save
      redirect_to @event, notice: 'See you there!'
    else
      redirect_to @event, alert: 'Could not join!'
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @attendance = current_user.attendances.find_by(attended_event_id: @event.id)
    @attendance.destroy
    redirect_to @event, notice: "We'll miss you :("
  end
end
