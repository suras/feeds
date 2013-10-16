class FeedsController < ApplicationController
  def index
  	@allfeeds = Feed.all
  	@feeds = @allfeeds.group_by{ |feed| feed.date.strftime("%Y-%m-%d")}
  	@feed_dates = @allfeeds.map{ |feed| feed.date.strftime("%Y-%m-%d")}.uniq
  	@feed_streams = Array.new
  	# @feed_dates = @feeds.map{ |feed| feed.date }.uniq
  	# @feed_streams = Hash.new
  	# @feed_dates.each do |d|

   #    feed = Feed.where(:date => d).order("time desc")

   #    @feed_streams = feed.to_json

  	# end
    @feed_dates.each do |d|
     ids = @feeds[d].map{|feed| feed.id}
     #@feed_streams << Feed.select([:stock, :date, :time]).where(:id => ids).count(:group=>"stock")
     @feeds_in_dates = Feed.where(:id => ids)
     @feeds_in_dates = @feeds_in_dates.map{|feed| feed.time}.uniq
     @feeds_in_dates.each do |t|

      @feed_streams << Feed.where(:id => ids, :time => t).count(:group=>"stock")
       @feed_streams[@feed_streams.length-1].merge!("date" => d).merge!("time" => t.strftime("%H:%M"))
     end
    
    end

    binding.pry

  end
end
