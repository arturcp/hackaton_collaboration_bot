module SlackHelper
  def dashboard_url
    "#{ENV.fetch('SITE_URL')}#{dashboard_path}"
  end

  def success_response(house_cup, house_name, points)
    house_cup.success_text % { house_name: house_name, points: points, dashboard_url: dashboard_url }
  end
end
