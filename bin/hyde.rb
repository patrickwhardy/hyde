#!/usr/bin/env ruby

#args = ARGV
args = ["new", "~/my_sweet_blog"]
puts "You ran Hyde with these arguments: #{args}"
#verify ARGV input is taken in as string

#ARGV[0] == "new", ARGV[1] == "directory name"
#"directory name" must start with either ~/ or "user/" AND "directory name" cannot exist
  #unless File.exists?("filename")
#if ARGV[0] is "new" then run file
#if either condition isnt met raise arg error
#http://stackoverflow.com/questions/19280341/create-directory-if-it-doesnt-exist-with-ruby

#string from ARGV1 will be name of parent directory
  #parent_directory = ARGV1
#verify that we can create a new directory with this name i.e. Dir.mkdir("dirname") works
#verify we can create a sub-directory
  #Dir.mkdir(parent_directory/_output)
#create another sub dir
  #Dir.mkdir(parent_directory/source)
  #source_dir = parent_directory/source
#create subdirectories of source
  #Dir.mkdir(source_dir/css)
  #Dir.mkdir(source_dir/pages)
  #Dir.mkdir(source_dir/posts)
#create files in source directory
  #File.write(source_dir/index.markdown)
#create files in subdirectories
  #File.write(source_dir/css/main.css)
  #File.write(source_dir/pages/about.markdown)
  #File.write(source_dir/posts/2016-02-20-welcome-to-hyde.markdown