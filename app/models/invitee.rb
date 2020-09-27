class Invitee < ApplicationRecord
  belongs_to :event, counter_cache: true
  enum status: { active: 0, canceled: 1, archived: 2 }
end
