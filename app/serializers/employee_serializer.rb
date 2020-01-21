class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :active

  belongs_to :department
end
