require 'unit/spec_helper'
require 'garaio-changelog/commit'
require 'garaio-changelog/formatters/plain'

describe Formatters::Plain do

  it "Schreibt die Commit Nachrichten auf den Output" do
    output = stub

    output.should_receive(:<<).with("- README editiert [Yves Senn]\n")
    output.should_receive(:<<).with("- Benuztermaske angepasst [Hans Peter]\n")

    subject.write_to(output, [Commit.new(:author => 'Yves Senn',
                                         :message => 'README editiert'),
                              Commit.new(:author => 'Hans Peter',
                                         :message => 'Benuztermaske angepasst')])


  end

  context 'Mit Kategorien' do
    it "Gruppiert die Nachrichten nach Kategorie" do
      output = stub

      output.should_receive(:<<).with("# Feature\n")
      output.should_receive(:<<).with("  - README editiert [Yves Senn]\n")
      output.should_receive(:<<).with("  - Benuztermaske angepasst [Hans Peter]\n")
      output.should_receive(:<<).with("# Bugfix\n")
      output.should_receive(:<<).with("  - Layout wird im InternetExplorer richtig dargestellt [Fritz Gerber]\n")

      subject.write_to(output, [
                                Commit.new(:author => 'Yves Senn',
                                           :message => 'README editiert',
                                           :kategorie => :feature),
                                Commit.new(:author => 'Fritz Gerber',
                                           :message => 'Layout wird im InternetExplorer richtig dargestellt',
                                           :kategorie => :bugfix),
                                Commit.new(:author => 'Hans Peter',
                                           :message => 'Benuztermaske angepasst',
                                           :kategorie => :feature)
                               ])


    end
  end

end
