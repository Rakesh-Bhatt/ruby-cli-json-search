# frozen_string_literal: true

require 'sinatra'
require 'json'
require 'pry'
require_relative './lib/user_upload_json_search'

get '/query' do
  # returns the values in text format, default is json
  content_type :text

  # gets search query
  value = params[:q]
  # gets which field to be searched
  field = params[:field]
  # gets file name
  file = params[:file]

  halt 400, { error: 'Missing params' }.to_json if file.nil? || field.nil? || value.nil?

  file_path = File.expand_path("./json/#{file}", __dir__)
  halt 400, { error: 'File not found' }.to_json unless File.exist?(file_path)

  repo = UserUploadJsonSearch.new(file_path)
  results = repo.search_by(field, value)
  results.map(&:convert_string).join("\n")
end
