require_relative 'todo_task'
require_relative 'git_command'
require_relative 'git_repo'

class CommitParser
  def initialize(repo_path)
    @repo_path = repo_path
  end

  # parse commits history and find any change content that has 'TODO' string in it
  def get_todo_tasks
    tasks = []
    author = nil
    email = nil
    timestamp = nil
    commit = nil
    change_file = nil

    git_repo.run do |_path|
      git_log_output = git_log_command.run

      git_log_output.each_line do |line|
        if line.match(/^COMMIT (.*) (.*) (.*) (.*)$/)
          author = Regexp.last_match(1)
          email = Regexp.last_match(2)
          timestamp = Regexp.last_match(3)
          commit = Regexp.last_match(4)
        elsif line.match(%r{^diff --git a/(.*) b/(.*)})
          change_file = Regexp.last_match(1)
        elsif line.match(/^(\+|-)(.*)TODO(.*)/)
          content = line
          task = TodoTask.new(author, email, timestamp, commit, change_file, content)
          tasks << task
        end
      end
    end

    tasks
  end

  private

  def git_repo
    GitRepo.new(@repo_path)
  end

  def git_log_command
    GitCommand.new('log', '--format="COMMIT %an %ae %at %h" -p -U0 --no-merges --reverse')
  end
end
