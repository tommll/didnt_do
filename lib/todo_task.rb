class TodoTask
  attr_accessor :author, :email, :timestamp, :commit_hash, :change_file, :change_content

  def initialize(author, email, timestamp, commit_hash, change_file, change_content)
    @author = author
    @email = email
    @timestamp = timestamp
    @commit_hash = commit_hash
    @change_file = change_file
    @change_content = change_content
  end

  def to_h(*_args)
    {
      author: author,
      email: email,
      timestamp: timestamp,
      commit_hash: commit_hash,
      change_file: change_file,
      change_content: change_content
    }
  end
end