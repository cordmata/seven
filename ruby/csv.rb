module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    attr_accessor :headers, :csv_contents

    def initialize
      read
    end

    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.csv'
      file = File.new(filename)

      @headers = file.gets.chomp.split(',')

      file.each do |row|
        @csv_contents << row.chomp.split(',')
      end
    end

    def each
      @csv_contents.each do |line|
        yield CsvRow.new(line, @headers)
      end
    end
  end

  class CsvRow
    def initialize(vals, names)
      @values = Hash[names.zip vals]
    end

    def method_missing name, *args
      @values[name.to_s]
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
# puts csv.headers.inspect
# puts csv.csv_contents.inspect

csv.each { |row| puts "total: #{row.total}, free: #{row.free}" }
