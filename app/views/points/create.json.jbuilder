if @house && @house.valid?
  json.text "#{@house.name} has now #{@house.points} points! See the house cup dashboard in www.dashboard.com.br"
end
