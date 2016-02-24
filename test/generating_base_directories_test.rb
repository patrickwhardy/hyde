require 'minitest/autorun'
require_relative 'generating_base_directories'

class GeneratingBaseDirectoriesTest
  gbd = GeneratingBaseDirectories.new
  gbd.make_directory(poopbutts)

end
