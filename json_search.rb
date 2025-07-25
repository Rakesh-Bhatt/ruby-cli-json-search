# frozen_string_literal: true

require 'json'
require_relative 'client'
require 'pry'

#
# Handles the search functionality for client
#
class JsonSearch
  #
  # initializes the method with default file path of client and create record for each client data
  #
  # @param [String/Nil] file_path - file path of the json
  #
  def initialize(file_path: nil)
    file_path = File.read('json/clients.json') if file_path.nil?
    parsed_data = JSON.parse(file_path)
    @clients = parsed_data.map { |attrs| Client.new(attrs) }
  end

  #
  # searches the all clients with given query in the name field and returns all the matching records
  #
  # @param [String] query - search parameter for names
  #
  # @return [Array] returns the records matching query in pretty format
  #
  def search_by_name(query)
    matching_clients = @clients.select { |client| client.full_name.downcase.include?(query.downcase) }
    matching_clients.map(&:print_each_client_record)
  end

  #
  # from the given clients list, groups the records by email and returns with record with matching
  #   records more than one
  #
  # @return [Array] returns matching duplicate records
  #
  def find_duplicates_by_email
    grouped = @clients.group_by(&:email)
    matching_emails =  grouped.select { |_, group| group.size > 1 }.values.flatten
    matching_emails.map(&:print_each_client_record)
  end
end
