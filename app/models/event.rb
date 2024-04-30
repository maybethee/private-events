class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendances
  scope :past, -> { where(date: (..(Time.now.midnight - 1.day))) }
  scope :upcoming, -> { where(date: ((Time.now.midnight - 1.day)..)) }
end
