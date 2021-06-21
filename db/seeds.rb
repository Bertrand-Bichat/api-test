require 'faker'


puts 'cleaning database'


Comment.destroy_all
Restaurant.destroy_all
User.destroy_all


puts 'generating users, restaurants and their comments'


(1..10).each do |id|

  user = User.create({
    email: Faker::Internet.email(domain: 'gmail'),
    password: 'password'
  })

  restaurant = Restaurant.create({
    user_id: user.id,
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    food_type: Faker::Restaurant.type,
    description: Faker::Restaurant.description
  })

  (1..5).each do |id|
    Comment.create({
      user_id: user.id,
      restaurant_id: restaurant.id,
      content: Faker::Restaurant.review,
      rating: Faker::Number.between(from: 1, to: 5)
    })
  end

end


puts "Done!"
