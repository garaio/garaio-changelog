# -*- coding: utf-8 -*-
require 'integration/spec_helper'

describe Changelog do

  let(:path_to_repository) { File.join(File.dirname(__FILE__), 'example_repo') }

  it 'Akzeptiert die Argumente von Git-Log' do
    output = StringIO.new
    log = Changelog.new(path_to_repository, 'v1.0.0..v1.1.0')

    log.write_to(output, :format => :plain)

    output.rewind
    output.readlines.should == <<-CHANGELOG
    - README hinzugefügt
    - Administrator-Benutzer hinzugefügt
    - Usability der Benutzermaske optimiert
    CHANGELOG
  end

end
