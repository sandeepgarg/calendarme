json.event do |json|
  json.partial! 'events/event', event: @event
  json.invitees do |invitee_json|
    invitee_json.array!(@event.invitees) do |invitee|
      json.partial! 'invitees/invitee', invitee: invitee
    end
  end
end
