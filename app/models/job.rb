class Job < ActiveRecord::Base

	belongs_to :user
	belongs_to :boat

	validates_presence_of :name, on: :create
	validates_presence_of :name, on: :update
	validates :name, uniqueness: { case_sensitive: false }

	validates :cost, numericality: { :greater_than_or_equal_to: 1000.00 }
	validates :crago, length: { minimum: 50 }

end
