class Boat < ActiveRecord::Base

	belongs_to :user
	has_many :jobs
	validates_presence_of :name, on: :create
	validates_presence_of :name, on: :update
	validates :name, uniqueness: { case_sensitive: false }
	has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
   validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
