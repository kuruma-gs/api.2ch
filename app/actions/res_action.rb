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
    puts params
    finish if params[:url].blank?
    http = EventMachine::HttpRequest.new(params[:url]).get
    http.callback do
      parser = Nokogiri::HTML.parse(http.response,nil,'CP932')
      render({
        :name=>parser.css('h1').first.content,
        :reses=>parser.css('dl.thread').first.css('dt').inject([]){|a,dt| a<<Res.new(dt.content,dt.next.content.gsub("  ","<br />").strip); a}}.to_json)
      finish
    end
  end
end
