module SlackHelper
  def dashboard_url
    "#{ENV.fetch('SITE_URL')}#{dashboard_path}"
  end

  def success_response(hackaton, team_name, points)
    hackaton.success_text % { team_name: team_name, points: points, dashboard_url: dashboard_url }
  end
end
