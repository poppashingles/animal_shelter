require_relative('../models/animal.rb')
require_relative('../models/owner.rb')
require('pry-byebug')


# Owner seeds
owner1 = Owner.new({
  "first_name" => "John",
  "last_name" => "Malone",
  "address" => "12 Great King Street",
  "email" => "jmalone@gmail.com",
  "photo_url" => "https://static.pexels.com/photos/160914/smile-man-worker-vertical-160914.jpeg",
  "phone_number" => "07839 932 885"
})
owner1.save()

owner2 = Owner.new({
  "first_name" => "Carol-Ann",
  "last_name" => "Spencer",
  "address" => "94a The Mound",
  "email" => "spencer.ca@inbox.com",
  "photo_url" => "https://static.pexels.com/photos/157907/smile-color-laugh-black-157907.jpeg",
  "phone_number" => "07128 945 244"
})
owner2.save()

owner3 = Owner.new({
  "first_name" => "Animal",
  "last_name" => "Shelter",
  "address" => "224 Animal Street",
  "email" => "support@animalshelter.com",
  "photo_url" => "https://groundsandhoundscoffee.com/wp-content/uploads/2014/03/pet-refuge-logo.png",
  "phone_number" => "0131 965 9390"
})
owner3.save()


# Animal seeds
animal1 = Animal.new({
  "name" => "Pebbles",
  "type" => "Dog",
  "adoptable" => "true",
  "admission_date" => "02-02-2017",
  # "adopted_date" => NULL,
  "photo_url" => "https://static.pexels.com/photos/551628/pexels-photo-551628.jpeg",
  "owner_id" => owner3.id
})
animal1.save()

animal2 = Animal.new({
  "name" => "Scrags",
  "type" => "Iguana",
  "adoptable" => "false",
  "admission_date" => "03-04-2017",
  # "adopted_date" => "06-05-2017",
  "photo_url" => "https://static.pexels.com/photos/325946/pexels-photo-325946.jpeg",
  "owner_id" => owner1.id
})
animal2.save()

binding.pry
nil
