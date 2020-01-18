class Employee < ActiveRecord::Base
  # NOTE: don't change the order of 'device' and 'include DeviseTokenAuth'
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  belongs_to :department
end
