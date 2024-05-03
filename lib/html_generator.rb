require 'erb'
require 'launchy'
require 'json'

class HtmlGenerator
  TEMPLATES_FOLDER = 'templates'.freeze
  DEFAULT_TEMPLATE_FILE = 'index.html.erb'.freeze

  def initialize(todo_tasks)
    @todo_tasks = todo_tasks
  end

  # return the path of the generated html file
  def generate_html
    default_html = File.read(Dir.pwd + "/#{TEMPLATES_FOLDER}/#{DEFAULT_TEMPLATE_FILE}")
    template = ERB.new(default_html)

    authors = []
    tasks = []

    todo_tasks_by_author.each do |author, tasks_of_author|
      authors << author
      tasks << tasks_of_author.size
    end

    result = template.result(binding)
    file_path = generate_html_file!(result)
  end

  private

  # if successful, return file path
  def generate_html_file!(data)
    file_name = "index_#{Time.now.to_i}.html"
    File.write("#{TEMPLATES_FOLDER}/#{file_name}", data)

    "#{TEMPLATES_FOLDER}/#{file_name}"
  end

  def todo_tasks_by_author
    @todo_tasks_by_author ||= @todo_tasks.group_by(&:author)
  end
end
