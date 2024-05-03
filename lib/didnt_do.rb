require 'launchy'
require_relative 'commit_parser'
require_relative 'html_generator'

class DidntDo
  def initialize(repo_path)
    @repo_path = repo_path
  end

  def generate_report
    parser = CommitParser.new(@repo_path)
    tasks = parser.get_todo_tasks

    html_generator = HtmlGenerator.new(tasks)
    file_path = html_generator.generate_html

    Launchy.open(file_path)
  end
end
