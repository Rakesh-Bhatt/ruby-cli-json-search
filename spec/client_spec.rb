require 'rspec'
require_relative '../client'

RSpec.describe Client do
  let(:attrs) do
    {
      'id' => 1,
      'full_name' => 'Alice Johnson',
      'email' => 'alice@example.com'
    }
  end
  let(:subject) { Client.new(attrs) }

  describe '#initialize' do
    it 'sets id correctly' do
      expect(subject.id).to eq(attrs['id'])
    end

    it 'sets full_name correctly' do
      expect(subject.full_name).to eq(attrs['full_name'])
    end

    it 'sets email correctly' do
      expect(subject.email).to eq(attrs['email'])
    end
  end

  describe '#print_each_client_record' do
    it 'returns a formatted string of the client record' do
      expected_output = 'ID: 1, Name: Alice Johnson, Email: alice@example.com'

      expect(subject.print_each_client_record).to eq(expected_output)
    end
  end
end
