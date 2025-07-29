# ruby-cli-json-search
#### This project provides two functionalities
1. Search from existing json file with field name and return all matching results, in addition to that duplicate email functionality with returns all the duplicate emails
2. REST API like functionality using **sinatra** which exposes a **'/query'** endpoint where we can provide which field to search, which value and which file

## 🚀 Quick Start

### Prerequisites
- **Ruby 3.2.2**

### ⚡ Installation
```bash
# 1. Clone the Repository
git clone git@github.com:Rakesh-Bhatt/ruby-cli-json-search.git

# 2. Navigate to project
cd ruby-cli-json-search

# 3. Install bundler if you do not have, give sudo permission in case of error
sudo gem install bundler:2.4.10

# 3. Install dependencies
bundle install

# 5. Make executables ready
chmod +x bin/cli

# 5. Test the installation
./bin/cli search_by_name
./bin/cli duplicates

# 6. Search with names
./bin/cli search_by_name john
```

### Running Tests
```bash
# Full test suite
bundle exec rspec

# Test specific class
bundle exec rspec spec/client_spec.rb
bundle exec rspec spec/json_search_spec.rb

# Test specific blocks, specify line or top level of block
bundle exec rspec spec/json_search_spec.rb:20 #line number

# After running all test cases we can check test coverage of last run, check
.last_run.json
```

### Rest API like interface
```bash
# To achieve Rest API like functionality I am using sinatra gem here, it is lightweight alternative
# instead of ROR

# run app.rb on a port to create server
ruby app.rb -p 3000

# create a new json inside json folder you want to search to
eg: I have created different_json.json

# open new terminal and make curl request, do not close the running puma server
curl "http://localhost:3000/query?q=alice&field=name&file=different_json.json"

# few additional use cases
curl "http://localhost:3000/query?q=true&field=is_active&file=different_json.json"
curl "http://localhost:3000/query?q=false&field=is_active&file=different_json.json"
```
