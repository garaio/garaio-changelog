class TextFormatter

  def write_to(output, commits)
    commits.each do |commit|
      output << "- %s [%s]\n" % [commit.message, commit.author]
    end
  end

end
