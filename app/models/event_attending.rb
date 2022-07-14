class EventAttending < ApplicationRecord
    belongs_to :attendee       , class_name: "User",     foreign_key: :user_id
    belongs_to :event          , class_name: "Event"
end