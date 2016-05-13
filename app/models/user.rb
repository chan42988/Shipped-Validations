class User < ActiveRecord::Base

	has_many :boats
	has_many :jobs
	has_many :follows
	has_many :boats, through: :follows


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
