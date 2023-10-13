module APIError
  class StandardError < ::StandardError
    attr_reader :title, :message, :errors, :status

    def initialize(title: nil, message: nil, errors: [], status:  nil)
      @title = title
      @status = status
      @errors = errors
      @message = message
    end

    def to_hash
      {
        title: title,
        status: status,
        errors: errors,
        message: message,
      }
    end

    def serializable_hash
      to_hash.compact_blank
    end

    def to_json(_options = {})
      serializable_hash.to_json
    end
  end
end
