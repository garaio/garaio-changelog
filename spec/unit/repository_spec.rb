# -*- coding: utf-8 -*-
require "unit/spec_helper"
require "garaio-changelog/repository"
require "garaio-changelog/commit"

describe Repository do

  it "liefert die commits der range" do
    ziel_repository = 'pfad/zu/repo'
    commit_range = 'release..master'
    commit_parser = mock(:format => "'%H☠%an'")
    repo = Repository.new(ziel_repository, commit_parser)
    repo.should_receive(:'`').with("cd pfad/zu/repo && git log --pretty='%H☠%an' release..master").and_return(<<-LOG
6a4d545c736c5cb81a53bc9b8ea636cae39b02fe☠Yves Senn
2dd1c8412ae4710d20fc5313ccf9e037ec6ca534☠Yves Senn
ad628eb8365e5339c9c19f557f08192b43d7ca29☠Yves Senn
LOG
                                                                                                              )
    commit_parser.should_receive(:parse).with('6a4d545c736c5cb81a53bc9b8ea636cae39b02fe☠Yves Senn').and_return('commit1')
    commit_parser.should_receive(:parse).with('2dd1c8412ae4710d20fc5313ccf9e037ec6ca534☠Yves Senn').and_return('commit2')
    commit_parser.should_receive(:parse).with('ad628eb8365e5339c9c19f557f08192b43d7ca29☠Yves Senn').and_return('commit3')

    repo.commits(commit_range).should == ['commit1', 'commit2', 'commit3']
  end

end
