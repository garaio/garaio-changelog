require 'garaio-changelog/repository'
require 'garaio-changelog/pipeline'
require 'garaio-changelog/text_formatter'

class Changelog

  def initialize(path_to_repository, commit_range)
    @repository = Repository.new(path_to_repository)
    @commit_range = commit_range
  end

  def write_to(output, options = {})
    repository_commits = @repository.commits(@commit_range)
    @pipeline = Pipeline.default
    processed_commits = @pipeline.call(repository_commits)

    @text_formatter = TextFormatter.new
    @text_formatter.write_to(output, processed_commits)
  end

end
