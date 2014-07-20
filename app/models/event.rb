class Event < ActiveRecord::Base
	validates :event_name, presence: true
	validates :start_time, presence: true
end
