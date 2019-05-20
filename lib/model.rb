## http://www.benjaminoakes.com/2014/01/24/count_by-in-ruby/

module Enumerable
  def count_by(&block)
    group_by(&block).map { |criteria, group| [criteria, group.count] }
  end
end


class Entry
  attr_accessor :path,:ip
  def self.from row
    datum = row.split(" ")
    entry = Entry.new 
    entry.path = datum.first
    entry.ip = datum.last
    entry
  end
end

class Counter
  def initialize(entries)
    @entries = entries
    @stratergies = {
      views: PageView::CountStrategy,
      unique_views: UniquePageView::CountStrategy
    }
  end
  def count(stratergy)
    @stratergies[stratergy.to_sym].new.execute(@entries)
  end
end  

class PageView
  attr_accessor :path,:visits
  class CountStrategy
    def execute(entries)
      result = []
      entries.count_by(&:path).each do |path,count|
        page_view = PageView.new
        page_view.path = path
        page_view.visits = count
        result << page_view
      end
      result.sort_by(&:visits).reverse
    end
  end
  def to_s
    "#{path} #{visits} views"
  end
  def to_row
    [path,visits]
  end
end

class UniquePageView < PageView
  class CountStrategy
    def execute(entries)
      result = []

      entries.each do |entry|
        page_view = UniquePageView.new
        page_view.path = entry.path
        page_view.visits =  entries.select{|e|e.path==entry.path}.map(&:ip).uniq.count
        result << page_view
      end

      result.sort_by(&:visits)
        .uniq(&:path)
        .reverse

    end
  end
  def to_s
    "#{path} #{visits} unique views"
  end
end

class LogParser
  def initialize(file_contents)
    @file_contents = file_contents
  end   
  def parse
    entries = []
    
    @file_contents.split("\n").each do |line|
      entries << Entry.from(line) 
    end
          
    views = Counter.new(entries).count(:views)
    unique_views = Counter.new(entries).count(:unique_views)

    [views,unique_views]
  end
end