# List of tasks you didn't do
This is a re-implementation of https://github.com/amfeng/todidnt

* Technical Design: https://sugar-april-5dc.notion.site/DidntDo-67e88e29133f4e4da7d4dbd09f5c1ca0?pvs=4

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
