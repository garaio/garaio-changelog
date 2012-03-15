# -*- coding: utf-8 -*-
require 'unit/spec_helper'
require 'garaio-changelog/changelog_options'

describe ChangelogOptions do

  it 'Speichert das ausgewählte Format' do
    argumente = ["-f", "console"]

    options = ChangelogOptions.from_arguments(argumente)

    options.format.should == 'console'
    options.log_range.should be_nil
  end

  it 'Speichert die Commit Range' do
    argumente = ["v1.0.0..v1.1.0", "-f", "console"]

    options = ChangelogOptions.from_arguments(argumente)

    options.format.should == 'console'
    options.log_range.should == 'v1.0.0..v1.1.0'
  end

end
