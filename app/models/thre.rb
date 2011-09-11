# -*- encoding: utf-8 -*-
class Thre
  attr_accessor :number,:name,:board,:body

  def initialize name,number,board,body
    @name   = name
    @number = number
    @board  = board
    @body   = body
  end

  def to_json
    "{number:#{@number}, name:'#{@name}', board:'#{@board}', body:'#{@body}'}"
  end

end
