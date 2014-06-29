class Event < ActiveRecord::Base
	validates :title, presence: true
	validates :start_date, presence: true
	validates :start_time, presence: true
end
