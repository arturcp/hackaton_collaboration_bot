if @team
  json.attachments [@hackaton] do |hackaton|
    json.text "GO, #{@team.name}!"
    json.pretext success_response(@hackaton, @team.name, @team.points)
    json.image_url @team.avatar
  end
else
  json.attachments [@hackaton] do |hackaton|
    json.color hackaton.error_color
    json.pretext hackaton.error_pretext
    json.text hackaton.error_text
    json.image_url hackaton.error_image_url
  end
end
