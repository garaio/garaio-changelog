# -*- coding: utf-8 -*-
require 'unit/spec_helper'
require 'garaio-changelog/commit_parser'
require 'garaio-changelog/commit'

describe CommitParser do

  it 'Kennt das Log-Format für den git-log Befehl' do
    described_class.format.should == '%H☠%s☠%an☠%ai☠%cn☠%ci'
  end

  it 'erstellt Commits aus einer Zeile' do
    line = '6a4d545c736c5cb81a53bc9b8ea636cae39b02fe☠README hinzugefügt☠Yves Senn☠2012-03-13 14:15:37 +0100☠Hans Peter☠2013-03-13 14:15:37 +0200'
    described_class.parse(line).should == Commit.new(:commit_hash => '6a4d545c736c5cb81a53bc9b8ea636cae39b02fe',
                                                     :message => 'README hinzugefügt',
                                                     :author => 'Yves Senn',
                                                     :author_date => DateTime.parse('2012-03-13 14:15:37 +0100'),
                                                     :committer => 'Hans Peter',
                                                     :committer_date => DateTime.parse('2013-03-13 14:15:37 +0200'))
  end

end
