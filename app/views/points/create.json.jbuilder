if @house
  json.text success_response(@house.name, @house.points)
else
  json.text error_response
  json.attachments ['#f4dd1d'] do |color|
    json.color color
    json.image_url 'http://vignette2.wikia.nocookie.net/pokemon/images/e/ef/025Pikachu_Pokemon_Mystery_Dungeon_Red_and_Blue_Rescue_Teams.png/revision/latest?cb=20150105233050'
  end
end
