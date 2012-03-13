# -*- coding: utf-8 -*-
require 'unit/spec_helper'
require "garaio-changelog/changelog"

describe Changelog do

  let(:ziel_repository) { 'pfad/zu/repo' }
  let(:commit_range) { 'release..master' }
  let(:output) { mock }
  let(:processed_commits) { stub }

  before do
    commits = stub

    repository = mock
    pipeline = mock

    Repository.should_receive(:new).with(ziel_repository).and_return(repository)
    repository.should_receive(:commits).with(commit_range).and_return(commits)
    Pipeline.should_receive(:default).and_return(pipeline)
    pipeline.should_receive(:call).with(commits).and_return(processed_commits)
  end

  subject { Changelog.new(ziel_repository, commit_range) }

  it "Der PlainFormatter wird per Default verwendet" do
    formatter = mock
    Formatters::Plain.should_receive(:new).and_return(formatter)
    formatter.should_receive(:write_to).with(output, processed_commits)

    subject.write_to(output)
  end

  it 'Der Formatter kann angegeben werden' do
    formatter = mock
    Formatters::Console.should_receive(:new).and_return(formatter)
    formatter.should_receive(:write_to).with(output, processed_commits)

    subject.write_to(output, :format => :console)
  end

end
