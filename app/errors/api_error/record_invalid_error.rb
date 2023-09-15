module ApiError
  class RecordInvalidError < StandardError
    def initialize(errors = [])
      @errors = errors
      @status = '422'
      @title = 'Unprocessable Entity'
    end

    def serializer_hash
      errors.each_with_object([]) do |error, meno|
        meno << {
          title: title,
          status: status,
          deatil: error.full_message,
          source: { pointer: "data/attributes/#{error.attribute}" }
        }
      end
    end

    private

    attr_reader :errors
  end
end
