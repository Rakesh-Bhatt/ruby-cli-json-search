# frozen_string_literal: true

#
# initializes the Client data record and make additional changes to client records
#
class Client
  attr_reader :id, :full_name, :email

  #
  # initializes the client records
  #
  # @param [Hash] attrs - individual client record
  #
  def initialize(attrs)
    @id = attrs['id']
    @full_name = attrs['full_name']
    @email = attrs['email']
  end

  #
  # prints the record in structured way
  #
  # @return [String] final structured record of client
  #
  def print_each_client_record
    "ID: #{id}, Name: #{full_name}, Email: #{email}"
  end
end
