require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('cnb', '0.1.0') do |p|
  p.description     = "Simple CNB forex rate parser (Czech National Bank)"
  p.url             = "http://github.com/radim/cnb"
  p.author          = "Radim Marek"
  p.email           = "radim@laststation.net"
  p.ignore_pattern  = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }