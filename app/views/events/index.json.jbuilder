# frozen_string_literal: true

json.events do |events_element|
  events_element.array!(@events) do |event|
    json.partial! 'events/event', event: event
  end
end
