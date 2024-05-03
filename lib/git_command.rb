require 'subprocess'

class GitCommand
  attr_accessor :command_name, :options_str

  def initialize(command_name, options_str)
    @command_name = command_name
    @options_str = options_str
  end

  def run
    command_with_options = "git #{@command_name} #{@options_str}"

    out = Subprocess::Process.new(command_with_options, stdout: Subprocess::PIPE).stdout
    out.read
  end
end
