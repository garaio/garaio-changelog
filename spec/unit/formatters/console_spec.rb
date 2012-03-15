require 'unit/spec_helper'
require 'garaio-changelog/commit'
require 'garaio-changelog/formatters/console'

describe Formatters::Console do

  it "Schreibt die Commit Nachrichten auf den Output mit Consolen ANSI Formatierung" do
    output = stub

    output.should_receive(:<<).with("\e[33m-\e[0m README editiert \e[31m[Yves Senn]\e[0m\n")
    output.should_receive(:<<).with("\e[33m-\e[0m Benuztermaske angepasst \e[31m[Hans Peter]\e[0m\n")

    subject.write_to(output, [Commit.new(:author => 'Yves Senn',
                                         :message => 'README editiert'),
                              Commit.new(:author => 'Hans Peter',
                                         :message => 'Benuztermaske angepasst')])

  end

end
