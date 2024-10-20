# frozen_string_literal: true

# The Log line parser class
class LogLineParser
  PREFIXES = ['[INFO]:', '[WARNING]:', '[ERROR]:'].freeze

  def initialize(line)
    @line = line
  end

  def message
    PREFIXES.each do |prefix|
      return @line[prefix.size..].strip if @line.start_with?(prefix)
    end
  end

  def log_level
    PREFIXES.each do |prefix|
      return prefix[1, prefix.size - 3].downcase.strip if @line.start_with?(prefix)
    end
  end

  def reformat
    "#{message} (#{log_level})"
  end
end

if __FILE__ == $0
  log = LogLineParser.new('[ERROR]: Invalid Operation')
  puts "Message: #{log.message}"
  puts "Log Level: #{log.log_level}"
  puts "Reformatted: #{log.reformat}"

  puts ''

  log = LogLineParser.new("[WARNING]: Disk almost full\r\n")
  puts "Message: #{log.message}"
  puts "Log Level: #{log.log_level}"
  puts "Reformatted: #{log.reformat}"
end
