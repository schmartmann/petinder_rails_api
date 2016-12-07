# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Pet.destroy_all

hammy = Pet.create({
    name: "Jamon",
    photo: "https://scontent-lga3-1.cdninstagram.com/t51.2885-15/e35/14565078_588653247985534_7719561011358859264_n.jpg?ig_cache_key=MTM1MTcxMjAxMTM3Mjg4NTc5Ng%3D%3D.2",
    description: "A perfect angel",
    pet_id: 1,
    link: "https://www.instagram.com/jamonthefrenchie/",
    city: "New York",
    state: "NY",
    animal: "Frenchie"
  })

  puts "Create #{Pet.count} pets"
