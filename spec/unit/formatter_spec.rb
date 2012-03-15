require 'unit/spec_helper'
require 'garaio-changelog/commit'
require 'garaio-changelog/formatter'

describe Formatter do

  let(:formatter_impl_class) do
    Class.new(Formatter) do
      def write_header(output, header)
        output << "#{header}\n"
      end

      def write_commit(output, commit)
        output << "COMMIT #{commit.message}\n"
      end

      def indent(output, level)
        output << ("\t" * level)
      end
    end
  end

  subject { formatter_impl_class.new }

  it "Schreibt die Commit Nachrichten auf den Output" do
    output = stub

    output.should_receive(:<<).with("COMMIT 1\n")
    output.should_receive(:<<).with("COMMIT 2\n")

    subject.write_to(output, [Commit.new(:message => '1'),
                              Commit.new(:message => '2')])


  end

  context 'Wenn die Commits kategorisiert sind' do
    it "Gruppiert die Nachrichten nach Kategorie" do
      output = stub

      output.should_receive(:<<).with("Feature\n")
      output.should_receive(:<<).with("\t")
      output.should_receive(:<<).with("COMMIT 1\n")
      output.should_receive(:<<).with("\t")
      output.should_receive(:<<).with("COMMIT 3\n")
      output.should_receive(:<<).with("Bugfix\n")
      output.should_receive(:<<).with("\t")
      output.should_receive(:<<).with("COMMIT 2\n")

      subject.write_to(output, [
                                Commit.new(:kategorie => :feature, :message => '1'),
                                Commit.new(:kategorie => :bugfix, :message => '2'),
                                Commit.new(:kategorie => :feature, :message => '3')
                               ])


    end
  end

end
