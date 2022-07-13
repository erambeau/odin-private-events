class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"

    has_many :event_attending
    has_many :users, through: :event_attending
end
