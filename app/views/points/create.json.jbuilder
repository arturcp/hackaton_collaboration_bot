if @house
  json.text "#{@house.name} has now #{@house.points} points! Check the house cup dashboard in #{dashboard_url}"
else
  json.text 'Oops. Something is wrong =/ It\'s better to find Dumbledore.'
end
