class Pipeline
  class KategorieExtractor

    def call(commit)
      case commit.message
      when /^bugfix/, /^hotfix/, /^fix/
        commit.kategorie = :bugfix
      when /^ignore/
        commit = nil
      else
        commit.kategorie = :feature
      end
      commit
    end

  end
end
