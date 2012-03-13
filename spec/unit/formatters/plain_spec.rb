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

end
