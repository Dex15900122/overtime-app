100.times do |post|
  Post.create!(date: Date.today, rationable: "#{post} rationable content")
end

puts "100 Posts has been create"