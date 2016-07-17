module DashboardHelper
  COLORS = [
    'green',
    'pink',
    'blue-grey',
    'purple',
    'red',
    'lime',
    'amber',
    'light-green',
    'orange',
    'brown',
    'deep-orange',
    'teal',
    'indigo',
    'cyan',
    'deep-purple'
  ]

  def card_color(index)
    COLORS[index] || 'green'
  end

  def dashboard_url
    "#{ENV.fetch('SITE_URL')}#{dashboard_path}"
  end
end
