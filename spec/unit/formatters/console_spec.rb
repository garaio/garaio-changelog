# -*- coding: utf-8 -*-
require 'unit/spec_helper'
require 'garaio-changelog/commit'
require 'garaio-changelog/formatter'

describe Formatters::Console do

  it 'Formatiert Titelzeilen Grün' do
    output = mock
    output.should_receive(:<<).with("\e[32m# Titelzeile\e[0m\n")
    subject.write_header(output, 'Titelzeile')
  end

  it 'Rückt zwei Spaces ein' do
    output = mock
    output.should_receive(:<<).with("  ")
    subject.indent(output, 1)
  end

  it "Gibt Commit-Nachrichten mit Autor aus + ANSI Farben" do
    output = stub

    output.should_receive(:<<).with("\e[33m-\e[0m README editiert \e[31m[Yves Senn]\e[0m\n")

    subject.write_commit(output, Commit.new(:author => 'Yves Senn',
                                            :message => 'README editiert'))
  end

end
