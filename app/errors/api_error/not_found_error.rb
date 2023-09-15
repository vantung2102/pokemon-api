module ApiError
  class NotFoundError < StandardError
    def initialize(message: nil)
      super(
        status: '404',
        title: 'Not Found',
        deatil: message || 'The finding resource can not be found'
      )
    end
  end
end
