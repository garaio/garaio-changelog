# -*- coding: utf-8 -*-
require 'unit/spec_helper'
require 'garaio-changelog/commit'
require 'garaio-changelog/formatter'

describe Formatters::Plain do

  it 'Rückt zwei Spaces pro Level ein' do
    output = mock
    output.should_receive(:<<).with('    ')
    subject.indent(output, 2)
  end

  it 'Titelzeilen werden mit einem # dargestellt' do
    output = mock
    output.should_receive(:<<).with("# Titelzeile\n")
    subject.write_header(output, 'Titelzeile')
  end

  it 'Commits werden mit Nachricht und Autor ausgegeben' do
    output = mock
    output.should_receive(:<<).with("- Neue Funktion [Samuel Tonini]\n")
    subject.write_commit(output, Commit.new(:message => 'Neue Funktion',
                                            :author => 'Samuel Tonini'))
  end

end
