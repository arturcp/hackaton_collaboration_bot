FactoryGirl.define do
  factory :hackaton do
    name 'Harry Potter Hackaton'
    success_pretext '%{team_name} has now %{points} points! Check the hackaton dashboard in %{dashboard_url}'
    success_text 'Go, %{team_name}!'
    error_color '#f4dd1d'
    error_pretext 'Oops. Something is wrong =/ '
    error_text 'It\'s better to call Dumbledore'
    error_image_url 'http://cdn.collider.com/wp-content/uploads/2015/06/harry-potter-and-the-sorcerers-stone.jpg'
  end
end
