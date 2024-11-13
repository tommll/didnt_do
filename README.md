# List of tasks you didn't do
This gem lists out a list of tasks you forgot to do
* A task: a git commit with "TODO" in message

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

## TODO
- [ ] Get TODO tasks of latest commits only

## Inspiration
https://github.com/amfeng/todidnt