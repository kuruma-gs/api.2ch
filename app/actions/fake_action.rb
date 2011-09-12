# -*- encoding: utf-8 -*-
class FakeAction < Cramp::Action
  use_fiber_pool

  def respond_with
    [200, {'Content-Type' => 'application/json','Access-Control-Allow-Origin'=>'*','Access-Control-Allow-Methods'=>'*','Access-Control-Allow-Headers'=>'X-Requested-With,X-Prototype-Version'}]
  end

  def start
    render '[{"n":1, "name":"名無し募集中。。。", "at":"2011/09/07(水) 05:12:34.69 0", "body":"テスト"},{"n":2, "name":"名無し募集中。。。", "at":"2012/09/08(水) 05:12:34.69 0", "body":"テスト2"}]'
    finish
  end
end

