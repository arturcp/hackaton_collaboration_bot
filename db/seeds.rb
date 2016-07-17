# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

House.delete_all
House.create!(name: 'Slytherin', avatar: 'http://vignette1.wikia.nocookie.net/harrypotter/images/d/da/S_final.jpg/revision/latest?cb=20120927162347&path-prefix=pt-br')
House.create!(name: 'Ravenclaw', avatar: 'http://vignette3.wikia.nocookie.net/harrypotter/images/d/da/R_final.jpg/revision/latest?cb=20121116111801&path-prefix=pt-br')
House.create!(name: 'Hufflepuff', avatar: 'http://vignette3.wikia.nocookie.net/harrypotter/images/3/3f/H_final.jpg/revision/latest?cb=20121101125148&path-prefix=pt-br')
House.create!(name: 'Gryffindor', avatar: 'http://vignette3.wikia.nocookie.net/harrypotter/images/0/06/G_final_%281%29.jpg/revision/latest?cb=20121116012731&path-prefix=pt-br')
