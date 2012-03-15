module Formatters
  class Console

    def write_to(output, commits)
      commits.each do |commit|
        output << "%s-%s %s %s[%s]%s\n" %
          [colors[:yellow], colors[:end], commit.message,
           colors[:red], commit.author, colors[:end]]
      end
    end

    def colors
      {
        :red => "\e[31m",
        :yellow => "\e[33m",
        :end => "\e[0m"
      }
    end
    private :colors

  end
end
