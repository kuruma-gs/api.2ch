# -*- encoding: utf-8 -*-
class Res
  attr_accessor :n,:name,:at,:body

  def initialize dt,dd
    dt dt
    dd dd
  end

  def dt str
    tap{@n,@name,@at = str.split("：").map{|s| s.strip}}
  end

  def dd str
    tap{@body = str}
  end

  def to_json(*args)
    {n: @n, name: @name, at: @at, body: @body}.to_json(*args)
  end

end
