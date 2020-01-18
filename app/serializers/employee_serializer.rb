class EmployeeSerializer < ActiveModel::Serializer
  attributes :email, :name, :active

  belongs_to :department
end
