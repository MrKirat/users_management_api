DEPARTMENT_NAMES = ["HR", "Tech", "Finance"]

DEPARTMENT_NAMES.each do |name|
  Department.create!(name: name) if Department.where(name: name).first.blank?
end

20.times do |n|
  random_department = Department.offset(rand(Department.count)).first
  user = Employee.where(email: "test#{n}@test.com").first
  Employee.create!(email: "test#{n}@test.com",
                   name: "Test #{n}",
                   password: "123456",
                   department: random_department) if user.blank?
end