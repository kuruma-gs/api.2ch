# -*- encoding: utf-8 -*-
require 'em-http-request'
require 'em-synchrony/em-http'
require 'nokogiri'
class ThreAction < Cramp::Action
  use_fiber_pool

  def respond_with
    [200, {'Content-Type' => 'application/json'}]
  end

  def start
    http = EventMachine::HttpRequest.new("http://find.2ch.net/?STR=#{params[:q]}&TYPE=TITLE&x=0&y=0&BBS=ALL&ENCODING=utf-8&COUNT=50").get
    http.callback do
      h = http.response.gsub(/<\!--.+-->/,'')       # 文字コードを抜く
      parser = Nokogiri::HTML.parse(h)              # 
      parser.css('div.wrapper dl').each do |dl|
        render dl.css('dt').inject([]){|a,dt|
          a << Thre.new(
            dt.css('a').first.content,
            dt.content.scan(/ \((\d+)\)/).flatten.first,
            dt.css('a').last.content,
            dt.next.css('td.r_sec_body').first.content.gsub(' 板内 他の板 同じサーバ スレへのリンク p2で抽出 類似スレ','')
          ); a
        }.to_json
      end
      finish
    end
  end
end
