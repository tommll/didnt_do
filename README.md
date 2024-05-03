# List of tasks you didn't do
This is a re-implementation of https://github.com/amfeng/todidnt

## Install local gem
```ruby
gem build didntdo.gemspec
gem install ./didntdo-${version}.gem
```

## Usage
```ruby
require 'didntdo'

repo_path = '$path_to_your_git_repo'

DidntDo.new(repo_path).generate_report
```