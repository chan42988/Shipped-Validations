class Boat < ActiveRecord::Base

	belongs_to :user
	has_many :jobs 
	has_many :follows
	has_many :users, through: :follows
 	validates :name, :max_containers, :location, :user_id, presence: true
	validates :name, uniqueness: { case_sensitive: false }

	has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
