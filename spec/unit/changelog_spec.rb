# -*- coding: utf-8 -*-
require 'unit/spec_helper'
require "garaio-changelog/changelog"

describe Changelog do

  it "Erstellt das Changelog für eine Commitrange im Zielrepository" do
    ziel_repository = 'pfad/zu/repo'
    commit_range = 'release..master'
    commits = ['Commits..']
    processed_commits = stub

    output = stub
    repository = mock
    pipeline = mock
    formatter = mock

    Repository.should_receive(:new).with(ziel_repository).and_return(repository)
    repository.should_receive(:commits).with(commit_range).and_return(commits)
    Pipeline.should_receive(:default).and_return(pipeline)
    pipeline.should_receive(:call).with(commits).and_return(processed_commits)
    Formatters::Plain.should_receive(:new).and_return(formatter)
    formatter.should_receive(:write_to).with(output, processed_commits)

    changelog = Changelog.new(ziel_repository, commit_range)

    changelog.write_to(output)
  end

end
