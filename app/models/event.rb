class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"

    scope :past, -> { where("date_event < '2022-08-06'") }
    scope :upcoming, -> { where("date_event >= '2022-08-06'") }

    has_many :event_attending
    has_many :users, through: :event_attending, :source => :attendee
end
