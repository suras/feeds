#require 'open-uri'
# require 'net/ping'
class Feed < ActiveRecord::Base
  attr_accessible :date, :status, :stock, :time
  after_save :push_faye



  def push_faye

     # `ping -q -c #{1} #{"http://localhost:3000/feeds.js"}`
     #Net::HTTP.new("http://localhost:3000/feeds.js").head('/').kind_of? Net::HTTPOK
     # Net::HTTP.get(URI.parse("http://localhost:3000/feeds.js"))
     #contents = open("http://localhost:3000/feeds.js").read
     ping_count = 10
     server = "http://localhost:3000/feeds.js"
    #result = `ping -q -c #{ping_count} #{server}`
    #Net::PingExternal.new(server).ping
   Net::Ping::HTTP.new(server).ping
    


  end
end
