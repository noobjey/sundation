class Committee < OpenStruct

  def self.service
    @service ||= SunlightService.new
  end

  def self.where(params)
    service.committees(params).map { |committee| Committee.new(committee) }
  end
end
