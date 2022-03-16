require 'time_error'

RSpec.describe TimeError do
  it "calls an API to determine the server time and find the difference with the time on this machine" do
    requester_dbl = double :requester
    time_now = Time.new(2022, 3, 16, 12, 17, 0)
    expect(requester_dbl).to receive(:get).with(URI("https://worldtimeapi.org/api/ip")).and_return('{"abbreviation":"GMT","client_ip":"165.225.17.23","datetime":"2022-03-16T12:17:28.077852+00:00","day_of_week":3,"day_of_year":75,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1647433048,"utc_datetime":"2022-03-16T12:17:28.077852+00:00","utc_offset":"+00:00","week_number":11}')

    new_time_error = TimeError.new(requester_dbl, time_now)
    expect(new_time_error.error).to eq 28.077852
  end
end