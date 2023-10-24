module Upload
  class UpsertBlobService < ApplicationService
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def call
      validate_file!
      upload_and_insert!
    end

    private

    def allowed_content_types
      %r{image/\w+|video/\w+|audio/\w+}
    end

    def validate_file!
      unless allowed_content_types.match?(file.content_type)
        raise APIError::BadRequestError, 'Invalid content type, submit content must be image, video or audio'
      end

      return unless file.size > 100.megabytes

      raise APIError::BadRequestError, 'File size is too large, can not be greather than 100MB'
    end

    def upload_and_insert!
      ActiveStorage::Blob.create_and_upload!(
        io: file.open,
        filename: file.original_filename,
        content_type: file.content_type
      )
    end
  end
end
