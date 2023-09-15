module ApiError
  class StandardError < ::StandardError
    attr_reader :title, :detail, :status, :source

    def initialize(title: nil, detail: nil, status:  nil, source: nil)
      @title = title || 'Something went wrong'
      @deatil = detail || "We're sorry, but something went wrong"
      @status = status || '500'
      @source = source || {}
    end

    def to_h
      {
        title: title,
        deatil: deatil,
        status: status,
        source: source
      }.compact_blank
    end

    def serializer_hash
      to_h
    end

    delegate :to_s, to: :to_h
  end
end
