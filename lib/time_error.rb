require 'date'
require 'json'


class TimeError
  def initialize(requester, time_now)
    @requester = requester
    @time_now = time_now
  end
  # Returns difference in seconds between server time
  # and the time on this computer
  def error
    return get_server_time - @time_now
  end

  private

  def get_server_time
    text_response = @requester.get(URI("https://worldtimeapi.org/api/ip"))
    json = JSON.parse(text_response)
    return DateTime.parse(json["utc_datetime"]).to_time
  end
end