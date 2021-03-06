Comment.destroy_all
Like.destroy_all
Rating.destroy_all
Dog.destroy_all

parsedDogsFile = JSON.parse(File.read('dailypuppy.json'))

newDogs = parsedDogsFile[0..57].select do |dog|
        dog.extend Hashie::Extensions::DeepFind
        dog.deep_find("media_url")
    end

newDogs.flatten.each do |dog|
    dog.extend Hashie::Extensions::DeepFind
    if dog.deep_find("media_url").exclude?("tweet_video_thumb")
        Dog.create(image_url: dog.deep_find("media_url"))
    end
end


Dog.all.each do |dog|
    5.times do
    Rating.create(value:rand(10..20), dog_id: dog.id)
    end
end

adjectives = ["cute", "adorable", "beautiful", "sweet","goofy","attractive", "handsome", "precious", "cuddly", "beloved", "big", "smol", "furry", "fuzzy", "dashing", "good", "gorgeous", "huggable", "perfect", "pretty", "regal", "scruffy", "shiny", "sleek", "soft", "snuggly", "wonderful"]

Dog.all.each do |dog|
    i  = rand(2)
    i.times do
    Comment.create(author:Faker::Name.first_name, content:"This #{adjectives.sample} pupper goes #{Faker::Creature::Dog.sound}.", dog_id: dog.id)
    end
end

Dog.all.each do |dog|
    i  = rand(2)
    i.times do
    Comment.create(author:Faker::Name.first_name, content:"I love this #{adjectives.sample} doggo.", dog_id: dog.id)
    end
end

Dog.all.each do |dog|
    i  = rand(2)
    i.times do
    Comment.create(author:Faker::Name.first_name, content:"What a #{adjectives.sample} pooch.", dog_id: dog.id)
    end
end

Dog.all.each do |dog|
    i  = rand(2)
    i.times do
    Comment.create(author:Faker::Name.first_name, content:Faker::Creature::Dog.meme_phrase, dog_id: dog.id)
    end
end

Dog.all.each do |dog|
    i  = rand(2)
    i.times do
    Comment.create(author:Faker::Name.first_name, content:"I would die for this #{adjectives.sample} dog.", dog_id: dog.id)
    end
end

Dog.all.each do |dog|
    i  = rand(1..20)
    i.times do
        Like.create(dog_id:dog.id)
    end
end

puts "Seeded!"
