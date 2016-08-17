if @team
  json.attachments [@hackaton] do |hackaton|
    json.text hackaton.success_text % { team_name: @team.name }
    json.pretext hackaton.success_pretext % { team_name: @team.name, points: @team.points, dashboard_url: dashboard_url }
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
