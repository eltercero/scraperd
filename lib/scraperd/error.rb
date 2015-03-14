module Scraperd
  class Error < StandardError
    def initialize(message)
      super(message)
    end
  end 

  class Error::BadRequest < Scraperd::Error; end
end