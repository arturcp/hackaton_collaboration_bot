if @house
  json.attachments [@house_cup] do |house_cup|
    json.text "GO, #{@house.name}!"
    json.pretext success_response(@house_cup, @house.name, @house.points)
    json.image_url @house.avatar
  end
else
  json.attachments [@house_cup] do |house_cup|
    json.color house_cup.error_color
    json.pretext house_cup.error_pretext
    json.text house_cup.error_text
    json.image_url house_cup.error_image_url
  end
end
