module Formatters
  class Console < Formatter

    def write_header(output, header)
      output << "%s# %s%s\n" % [colors[:green], header, colors[:end]]
    end

    def indent(output, level)
      output << ('  ' * level)
    end

    def write_commit(output, commit)
      output << "%s-%s %s %s[%s]%s\n" % [colors[:yellow], colors[:end],
                                         commit.message,
                                         colors[:red], commit.author, colors[:end]]
    end

    def colors
      {
        :red => "\e[31m",
        :yellow => "\e[33m",
        :green => "\e[32m",
        :end => "\e[0m"
      }
    end
    private :colors

  end
end
