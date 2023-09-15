# frozen_string_literal: true

class ApplicationDecorator < SimpleDelegator
  def self.wrap_all(collection)
    collection.map { |element| new(element) }
  end
end
