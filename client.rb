# frozen_string_literal: true

#
# initializes the Client data record and make additional changes to client records
#
class Client
  #
  # initializes the client records
  #
  # @param [Hash] attrs - individual client record
  #
  def initialize(attrs)
    attrs.each do |key, value|
      instance_variable_set("@#{key}", value)
    end

    self.class.attr_reader(*attrs.keys.map(&:to_sym))
  end

  #
  # prints the record in structured way
  #
  # @return [String] final structured record of client
  #
  def print_each_client_record
    "ID: #{id}, Name: #{full_name}, Email: #{email}"
  end

  #
  # converts the available instance variables in string, maps key with value
  #
  # @return [String] all the available values
  #
  def convert_string
    instance_variables.map do |var|
      "#{var.to_s.delete('@')}: #{instance_variable_get(var)}"
    end.join(', ')
  end
end
