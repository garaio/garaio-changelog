class Formatter

  def write_to(output, commits)
    commits_nach_kategorie_gruppiert = Hash.new {|hash, key| hash[key] = []}
    commits.each do |commit|
      commits_nach_kategorie_gruppiert[commit.kategorie] << commit
    end

    commits_nach_kategorie_gruppiert.each do |kategorie, commits|
      write_header(output, kategorie.capitalize) if kategorie
      commits.each do |commit|
        indent(output, 1) if kategorie
        write_commit(output, commit)
      end
    end
  end

end

require 'garaio-changelog/formatters/plain'
require 'garaio-changelog/formatters/console'
