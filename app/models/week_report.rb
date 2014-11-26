class WeekReport < ActiveRecord::Base
	belongs_to :user
	belongs_to :project

	validates :user_id, presence: true
	validates :project_id, presence: true
	validates :done, presence: true, length: { maximum: 2000 }
	validates :understood, presence: true, length: { maximum: 2000 }
	validates :next, presence: true, length: { maximum: 2000 }
	validates :start_day, presence: true
	validates :end_day, presence: true

end
