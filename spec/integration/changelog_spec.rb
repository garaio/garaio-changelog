# -*- coding: utf-8 -*-
require 'integration/spec_helper'

describe "Garaio-Changelog Generator" do

  let(:path_to_repository) { File.join(File.dirname(__FILE__), 'example_repo') }

  it 'Akzeptiert die Argumente von Git-Log' do
    output = StringIO.new
    log = Changelog.new(path_to_repository, 'HEAD')

    log.write_to(output, :format => :plain)

    output.rewind
    output.readlines.should == ["# Bugfix\n",
                                "  - hotfix: Nicht jeder kann als Admin einloggen [Yves Senn]\n",
                                "# Feature\n",
                                "  - README hinzugefügt [Yves Senn]\n",
                                "  - Administrator-Benutzer hinzugefügt [Yves Senn]\n",
                                "  - Usability der Benutzermaske optimiert [Yves Senn]\n"]
  end

end
