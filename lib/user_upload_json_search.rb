# frozen_string_literal: true

require 'json'
require_relative '../client'

#
# this class searches any field from user given json and returns the response, even though we can use
# 	same class JsonUserSearch, but it separates the usability from CLI to rest API functionality
#
class UserUploadJsonSearch
  #
  # reads the value from the given JSON, and instantiates the values in client field, even though
  #		different json might not contains client record
  #
  # @param [String] file_path - file path of the json
  #
  def initialize(file_path)
    raw = File.read(file_path)
    parsed_data = JSON.parse(raw)
    @clients = parsed_data.map { |attrs| Client.new(attrs) }
  end

  #
  # search the given field with given value
  #
  # @param [String] field - field to search
  # @param [String] value - value to be searched
  #
  # @return [Array] all matching values
  #
  def search_by(field, value)
    @clients.select do |client|
      client.respond_to?(field) &&
        client.public_send(field).to_s.downcase.include?(value.downcase)
    end
  end
end
