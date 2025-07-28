require 'rspec'
require_relative '../json_search'
require_relative '../client'

RSpec.describe JsonSearch do
  let(:mock_data) do
    [
      { 'id' => 1, 'full_name' => 'Alice Johnson', 'email' => 'alice@example.com' },
      { 'id' => 2, 'full_name' => 'Alicia Keys', 'email' => 'alice@example.com' },
      { 'id' => 3, 'full_name' => 'Bob Smith', 'email' => 'bob@example.com' }
    ]
  end

  let(:searcher) do
    allow(File).to receive(:read).and_return(mock_data.to_json)

    JsonSearch.new
  end

  describe '#search_by_name' do
    context 'when matching result is received' do
      it 'finds clients by partial name' do
        results = searcher.search_by_name('alice')
        expect(results).to eq(['ID: 1, Name: Alice Johnson, Email: alice@example.com'])
      end
    end

    context 'when matching is not found' do
      it 'returns empty when no match' do
        results = searcher.search_by_name('nonexistent')
        expect(results).to be_empty
      end
    end
  end

  describe '#find_duplicates_by_email' do
    context 'when duplicate email is present in the JSON' do
      duplicate_emails = ['ID: 1, Name: Alice Johnson, Email: alice@example.com',
                          'ID: 2, Name: Alicia Keys, Email: alice@example.com']

      it 'returns clients with duplicate emails' do
        duplicates = searcher.find_duplicates_by_email

        expect(duplicates).to eq(duplicate_emails)
      end

      it 'returns two duplicate emails' do
        duplicates = searcher.find_duplicates_by_email

        expect(duplicates.size).to eq(2)
      end
    end
  end
end
