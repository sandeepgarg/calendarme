# frozen_string_literal: true

class EventForm
  include ActiveModel::Model

  attr_accessor :title, :description, :location, :time_zone, :start_time,
                :end_time, :status, :event_types, :user_id,
                :invitees_attributes
  attr_reader :user, :event

  delegate :invitees, to: :event
  validates :title, :location, :start_time, :end_time, :event_types, presence: true
  validate :invitees_present

  def initialize(user, event_id = nil, params = {})
    @user = user
    @event = event_id ? @user.events.find(event_id) : @user.events.build
    super(params)
  end

  def submit
    @event.attributes = event_params
    return false if invalid?

    @event.save
  end

  private

  def event_params
    {
      title: title || event.title,
      description: description || event.description,
      location: location || event.location,
      time_zone: time_zone || event.time_zone,
      start_time: start_time || event.start_time,
      end_time: end_time || event.end_time,
      status: status || event.status || 'active',
      event_types: event_types || event.event_types,
      invitees_attributes: invitees_attributes || {}
    }
  end

  def invitees_present
    return if invitees.present?

    errors.add(:event, "invitees can't be blank")
  end
end
