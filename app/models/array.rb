class Array
  def to_json
    "[#{self.map(&:to_json).join(",")}]"
  end
end
