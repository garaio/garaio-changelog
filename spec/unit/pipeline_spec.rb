# -*- coding: utf-8 -*-
require "garaio-changelog/pipeline"

describe Pipeline do

  let(:erster_abschnitt) { lambda {|i| "Schritt1: #{i}"} }
  let(:zweiter_abschnitt) { lambda {|i| "Schritt2: #{i}"} }

  subject { described_class.new([erster_abschnitt,
                                 zweiter_abschnitt]) }

  it "Jeder Abschnitt der Pipeline erhält als Input den Output des vorgängigen Abschnitts" do
    subject.call(['first', 'second', nil]).should == [ 'Schritt2: Schritt1: first',
                                                       'Schritt2: Schritt1: second']
  end

end
