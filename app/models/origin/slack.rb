module Origin
  class Slack
    def initialize(token)
      @token = token
    end

    def valid?
      return true unless Rails.env.production?

      @token == token
    end

    private

    def token
      ENV.fetch('SLACK_TOKEN', '')
    end
  end
end
