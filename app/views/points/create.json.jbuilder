if @house
  json.text success_response(@house.name, @house.points)
else
  json.text error_response
end
