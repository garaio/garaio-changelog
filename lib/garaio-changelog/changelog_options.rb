# -*- coding: utf-8 -*-
require 'optparse'
require 'ostruct'

class ChangelogOptions

  def self.from_arguments(arguments)
    options = OpenStruct.new

    opts = OptionParser.new do |opts|
      opts.banner = "Usage: garaio-changelog [COMMIT|RANGE] [options]"

      opts.separator ""
      opts.separator "Specific options:"

      opts.on("-f", "--format [plain|console]", "Ausgabe Format.") do |f|
        options.format = f
      end

      opts.on_tail("-h", "--help", "Zeige diese Ausgabge.") do
        puts opts
        exit
      end
    end

    opts.order(arguments) {|argument| options.log_range = argument; break}
    opts.parse!(arguments)

    options
  end

end
