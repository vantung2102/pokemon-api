module APIError
  class BadRequestError < StandardError
    def initialize(message = nil)
      super(
        status: 400,
        title: 'Bad Request',
        message: message || 'The request can not be processed'
      )
    end
  end
end
