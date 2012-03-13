require 'unit/spec_helper'
require 'garaio-changelog/commit'
require 'garaio-changelog/text_formatter'

describe TextFormatter do

  it "Schreibt die Commit Nachrichten auf den Output" do
    text_formatter = TextFormatter.new
    output = stub

    output.should_receive(:<<).with("- README editiert [Yves Senn]\n")
    output.should_receive(:<<).with("- Benuztermaske angepasst [Hans Peter]\n")

    text_formatter.write_to(output, [Commit.new(:author => 'Yves Senn',
                                                :message => 'README editiert'),
                                     Commit.new(:author => 'Hans Peter',
                                                :message => 'Benuztermaske angepasst')])


  end

end
