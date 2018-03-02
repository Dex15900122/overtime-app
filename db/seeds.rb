@user = User.create(email: "123456@xxx.com", password: "123456", password_confirmation: "123456", first_name: "Dex", last_name: "Kuo")

puts "1 User created"

AdminUser.create(email: "admin@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Admin", last_name: "Name")

puts "1 Admin User created"


100.times do |post|
  Post.create!(date: Date.today, rationable: "#{post} rationable content", user_id: @user.id)
end

puts "100 Posts has been create"