Hackaton.delete_all
Hackaton.create!(
  name: 'Harry Potter Hackaton',
  success_pretext: '%{team_name} has now %{points} points! Check the house cup dashboard in %{dashboard_url}',
  success_text: 'Go, %{team_name}!',
  error_color: '#f4dd1d',
  error_pretext: 'Oops. Something is wrong =/ ',
  error_text: "It's better to call Dumbledore",
  error_image_url: 'http://cdn.collider.com/wp-content/uploads/2015/06/harry-potter-and-the-sorcerers-stone.jpg'
)

Team.delete_all
Team.create!(name: 'Slytherin', avatar: 'http://vignette1.wikia.nocookie.net/harrypotter/images/d/da/S_final.jpg/revision/latest?cb=20120927162347&path-prefix=pt-br')
Team.create!(name: 'Ravenclaw', avatar: 'http://vignette3.wikia.nocookie.net/harrypotter/images/d/da/R_final.jpg/revision/latest?cb=20121116111801&path-prefix=pt-br')
Team.create!(name: 'Hufflepuff', avatar: 'http://vignette3.wikia.nocookie.net/harrypotter/images/3/3f/H_final.jpg/revision/latest?cb=20121101125148&path-prefix=pt-br')
Team.create!(name: 'Gryffindor', avatar: 'http://vignette3.wikia.nocookie.net/harrypotter/images/0/06/G_final_%281%29.jpg/revision/latest?cb=20121116012731&path-prefix=pt-br')
