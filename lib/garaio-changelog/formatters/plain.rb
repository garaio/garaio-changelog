module Formatters
  class Plain < Formatter

    def write_header(output, header)
      output << "# #{header}\n"
    end

    def write_commit(output, commit)
      output << ("- %s [%s]\n" % [commit.message, commit.author])

    end

    def indent(output, level)
      output << ('  ' * level)
    end

  end
end
