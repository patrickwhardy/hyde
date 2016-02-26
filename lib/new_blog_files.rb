require 'pry'
require_relative 'converter'
class NewBlogFiles

  attr_reader :parent_directory, :post_title, :message

  def initialize(parent_directory, post_title, message = ["Your content here"])
    @parent_directory = parent_directory
    @post_title = post_title
    @message = message
    @message = [message].join(" ")
    make_file
  end

  def make_file
    File.write("#{@parent_directory}/source/posts/#{@post_title}.markdown", prepopulated_content)
    @converter = Converter.new(@parent_directory)
  end

  def prepopulated_content
    "##{@post_title} \n\n #{@message}!"
  end
end
