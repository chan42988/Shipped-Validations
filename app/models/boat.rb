class Boat < ActiveRecord::Base

	belongs_to :user
	has_many :jobs
	validates_presence_of :name, on: :create
	validates_presence_of :name, on: :update
	validates :name, uniqueness: { case_sensitive: false }


end
