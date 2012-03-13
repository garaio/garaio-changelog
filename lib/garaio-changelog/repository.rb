# -*- coding: utf-8 -*-
require 'garaio-changelog/commit'
require "garaio-changelog/commit_parser"

class Repository

  def initialize(path_to_repository, commit_parser = CommitParser)
    @path_to_repository = path_to_repository
    @commit_parser = commit_parser
  end

  def commits(commit_range)
    output = `cd #{@path_to_repository} && git log --pretty=#{@commit_parser.format} #{commit_range}`.strip

    output.split("\n").map do |line|
      @commit_parser.parse(line)
    end
  end

end
