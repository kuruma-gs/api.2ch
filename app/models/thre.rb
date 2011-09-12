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
    %Q{{"number":#{@number}, "name":"#{@name.to_json}", "board":"#{@board.to_json}", "body":"#{@body.to_json}"}}
  end

end
