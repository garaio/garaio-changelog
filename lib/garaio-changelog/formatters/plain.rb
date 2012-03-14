module Formatters
  class Plain

    def write_to(output, commits)
      commits_nach_kategorie_gruppiert = Hash.new {|hash, key| hash[key] = []}
      commits.each do |commit|
        commits_nach_kategorie_gruppiert[commit.kategorie] << commit
      end

      commits_nach_kategorie_gruppiert.each do |kategorie, commits|
        output << "# #{kategorie.capitalize}\n" if kategorie
        commits.each do |commit|
          message = ''
          message += '  ' if kategorie
          message += "- %s [%s]\n" % [commit.message, commit.author]
          output << message
        end
      end
    end

  end
end
