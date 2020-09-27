class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    date = params[:date].presence || Date.current
    @events = current_user.events.where('CAST(start_time as date) = ?', date)
  end

  def show
    @event = current_user.events.find(params[:id])
  end

  def create
    @form = EventForm.new(current_user, nil, event_params)
    if @form.submit
      render json: { message: 'Event successfully created' }
    else
      render json: { message: @form.errors.full_messages.to_sentence }, status: 422
    end
  end

  def update
    @form = EventForm.new(current_user, params[:id], event_params)
    if @form.submit
      render json: { message: 'Event successfully updated' }
    else
      render json: { message: @form.errors.full_messages.to_sentence }, status: 422
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :time_zone,
                                  :start_time, :end_time, :status, :event_types,
                                  :user_id,
                                  invitees_attributes: %i[id name email
                                                          status event_id])
  end
end
