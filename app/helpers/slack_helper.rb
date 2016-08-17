module SlackHelper
  def dashboard_url
    "#{ENV.fetch('SITE_URL')}#{dashboard_path}"
  end

  def success_response(house_name, points)
    text = ENV.fetch('SUCCESS_RESPONSE', '')
    text % { house_name: house_name, points: points, dashboard_url: dashboard_url }
  end

  def error_response
    ENV.fetch('ERROR_RESPONSE', 'Oops. Something is wrong =/')
  end
end
