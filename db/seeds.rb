[Employee].each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table.table_name}")
end

20.times do |n|
  Employee.create!(email: "test#{n}@test.com", name: "Test #{n}", password: "123456")
end