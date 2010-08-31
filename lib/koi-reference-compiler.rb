require 'rubygems'

require File.expand_path(File.join(File.dirname(__FILE__), 'koi-reference-compiler/syntax_node.rb'))

require_files = []
require_files.concat Dir[File.join(File.dirname(__FILE__), 'koi-reference-compiler', '**', '*.rb')]

require_files.each do |file|
  require File.expand_path(file)
end
