class Boat < ActiveRecord::Base

	belongs_to :user
	has_many :jobs
 	validates :name, :max_containers, :location, :user_id, presence: true
	validates :name, uniqueness: { case_sensitive: false }


end
