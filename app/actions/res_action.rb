# -*- encoding: utf-8 -*-
require 'em-http-request'
require 'em-synchrony/em-http'
require 'nokogiri'
class ResAction < Cramp::Action
  use_fiber_pool

  def respond_with
    [200, {'Content-Type' => 'application/json; charset=utf-8','Access-Control-Allow-Origin'=>'*','Access-Control-Allow-Methods'=>'*','Access-Control-Allow-Headers'=>'X-Requested-With,X-Prototype-Version'}]
  end

  def start
    http = EventMachine::HttpRequest.new(params[:url]).get
    http.callback do
      parser = Nokogiri::HTML.parse(http.response,nil,'CP932')
      parser.css('dl.thread').each do |dl|
        render dl.css('dt').inject([]){|a,dt| a<<Res.new(dt.content,dt.next.content); a }.to_json
      end
      finish
    end
  end
end
