class Job < ActiveRecord::Base

	belongs_to :user
	belongs_to :boat

	validates :name, :containers_needed, :cargo, :origin, :destination, :cost, :boat_id, :user_id, presence: true
	validates :name, uniqueness: { case_sensitive: false }
	validates :cost, numericality: { greater_than_or_equal_to: 1000.00 }
	validates :cargo, length: { minimum: 50 }

end
