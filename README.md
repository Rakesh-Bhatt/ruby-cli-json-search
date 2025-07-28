# ruby-cli-json-search
This Projects provides functionality to search from a json file and returns matching results

## 🚀 Quick Start

### Prerequisites
- **Ruby 3.2.2**

### ⚡ Installation
```bash
# 1. Navigate to project
cd ruby-cli-json-search

# 2. Install dependencies
bundle install

# 3. Make executables ready
chmod +x bin/cli

# 4. Test the installation
./bin/cli search_by_name
./bin/cli duplicates
```

### Running Tests
```bash
# Full test suite
bundle exec rspec

# Test specific class
bundle exec rspec spec/client_spec.rb
bundle exec rspec spec/json_search_spec.rb

# Test specific blocks, specify line or top level of block
bundle exec rspec spec/json_search_spec.rb:20 #line
```