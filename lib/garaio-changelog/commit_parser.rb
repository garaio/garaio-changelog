# -*- coding: utf-8 -*-
module CommitParser

  def self.format
    mapping.keys.join(seperator)
  end

  def self.parse(line)
    data = line.split(seperator)
    attributes = Hash[mapping.values.zip(data)]

    Commit.new(attributes)
  end

  def self.mapping
    { '%H' => 'commit_hash',
      '%s' => 'message',
      '%an' => 'author',
      '%ai' => 'author_date',
      '%cn' => 'committer',
      '%ci' => 'committer_date'}
  end
  class << self; private :mapping; end

  def self.seperator
    '☠'
  end
  class << self; private :mapping; end

end
