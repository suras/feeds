class Feed < ActiveRecord::Base
  attr_accessible :date, :status, :stock, :time
  after_save :push_faye
  def push_faye
    server = "http://localhost:3000/feeds.js"
    Net::Ping::HTTP.new(server).ping
  end
end
