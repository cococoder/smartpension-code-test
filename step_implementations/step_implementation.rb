require("test/unit")
require("test/unit/rr")
require("rr")
require("byebug")
include(Test::Unit::Assertions)
require_relative("../lib/model.rb")
Gauge.configure do |config|
  config.include(RR::DSL)
end
step("log enteries <table>") do |entries|
  @entries = []
  entries.rows.each do |row|
    @entries << Entry.from(row["entry"])
  end
end
step("when counted by views") do
  @views = Counter.new(@entries).count(:views)
end
step("when counted by unique page views") do
  @unique_views = Counter.new(@entries).count(:unique_views)
end
step("should display unique views <table>") do |expected|
  expected.rows.each do |row|
    index = (row["ordinal"].to_i - 1)
    page_view = @unique_views[index]
    assert(page_view.to_s == row["output"], "#{row["output"]}#{" shoud be at index "}#{index}#{" but it was "}#{page_view.to_s}")
  end
end
step("should display views <table>") do |expected|
  expected.rows.each do |row|
    index = (row["ordinal"].to_i - 1)
    page_view = @views[index]
    assert(page_view.to_s == row["output"], "#{row["output"]}#{" shoud be at index "}#{index}#{" but it was "}#{page_view.to_s}")
  end
end

step 'the webserver.log is <file>' do |file|
	@file_contents = file
end
step 'create a parser' do ||
	@parser = LogParser.new(@file_contents)
end
step 'parse webserver log' do ||
  @views,@unique_views =  @parser.parse
end