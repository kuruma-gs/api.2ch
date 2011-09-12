class String

  def to_json
    self.gsub('"','\"')
  end

end
