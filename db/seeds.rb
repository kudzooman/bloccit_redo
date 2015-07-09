require 'faker'

10.times do 
  Advertisement.create!(
    title: Faker::Lorem.sentence,
    copy: Faker::Lorem.sentence
    )
end

50.times do 
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
end
posts = Post.all

100.times do 
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
end

puts "Seed finished"
puts "#{Post.count} post created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"

