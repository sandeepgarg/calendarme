class Event < ApplicationRecord
  has_many :invitees
  belongs_to :user

  enum event_types: { party: 0, concert: 1, seminar: 2, conference: 3,
                      workshop: 4 }
  enum status: { active: 0, canceled: 1, archived: 2 }
  accepts_nested_attributes_for :invitees
end
