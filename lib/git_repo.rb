class GitRepo
  def initialize(path)
    absolute_path = File.expand_path(path)

    if is_git_repo?(absolute_path)
      @working_dir = absolute_path
    else
      warn "Whoops, #{absolute_path} is not a git repository!"
      exit
    end
  end

  def run
    if Dir.pwd == @working_dir
      yield
    else
      Dir.chdir(@working_dir) do
        yield @working_dir
      end
    end
  end

  private

  def is_git_repo?(path)
    File.exist?(File.join(path, '.git'))
  end
end
