module ApiCache
  def get_cache_key
    key = request.path

    self.availableParams.keys.sort.each do |index|
      key.concat('/',index.downcase,':',self.availableParams[index].downcase)
    end

    key
  end
end