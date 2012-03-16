# -*- coding: utf-8 -*-
require 'garaio-changelog/pipeline/kategorie_extractor'

describe Pipeline::KategorieExtractor do


  context 'Feature' do
    it 'Alle Commits ohne Spezielle Formatierung in der Message' do
      commit = mock(:message => 'Neue Artikel können hinzugefüt werden')
      commit.should_receive(:kategorie=).with(:feature)
      subject.call(commit).should == commit
    end
  end

  context 'Bugfix' do
    it 'beinhaltet Nachrichten mit dem Text "bugfix"' do
      commit = mock(:message => 'bugfix: Scrollbar wird nicht dargestellt')
      commit.should_receive(:kategorie=).with(:bugfix)
      subject.call(commit).should == commit
    end

    it 'beinhaltet Nachrichten mit dem Text "hotfix"' do
      commit = mock(:message => 'hotfix: Scrollbar wird nicht dargestellt')
      commit.should_receive(:kategorie=).with(:bugfix)
      subject.call(commit).should == commit
    end

    it 'beinhaltet Nachrichten mit dem Text "fix"' do
      commit = mock(:message => 'fix: Scrollbar wird nicht dargestellt')
      commit.should_receive(:kategorie=).with(:bugfix)
      subject.call(commit).should == commit
    end
  end

  context 'Ausgeschlossene' do
    it 'Nachrichten mit dem Text "ignore" werden ausgeschlossen' do
      commit = mock(:message => 'ignore: Whitespace angepasst')
      subject.call(commit).should == nil
    end
  end

end
