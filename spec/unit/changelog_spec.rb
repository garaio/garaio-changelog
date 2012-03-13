# -*- coding: utf-8 -*-
require 'unit/spec_helper'
require "garaio-changelog/changelog"
require "garaio-changelog/repository"
require "garaio-changelog/pipeline"
require "garaio-changelog/text_formatter"

describe Changelog do

  it "Erstellt das Changelog für eine Commitrange im Zielrepository" do
    ziel_repository = 'pfad/zu/repo'
    commit_range = 'release..master'
    commits = ['Commits..']
    processed_commits = stub

    output = stub
    repository = mock
    pipeline = mock
    text_formatter = mock

    Repository.should_receive(:new).with(ziel_repository).and_return(repository)
    repository.should_receive(:commits).with(commit_range).and_return(commits)
    Pipeline.should_receive(:default).and_return(pipeline)
    pipeline.should_receive(:call).with(commits).and_return(processed_commits)
    TextFormatter.should_receive(:new).and_return(text_formatter)
    text_formatter.should_receive(:write_to).with(output, processed_commits)

    changelog = Changelog.new(ziel_repository, commit_range)

    changelog.write_to(output)
  end

end
