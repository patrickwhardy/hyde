require 'pry'
class NewBlogFiles

  attr_reader :path, :post_title, :message

  def initialize(path, post_title, message = "Your content here")
    @path = path
    @post_title = post_title
    @message = message
    binding.pry
  end

  def make_file
    File.write("#{@path}/#{@post_title}.markdown", prepopulated_content)
  end

  def prepopulated_content
    "##{@post_title} \n\n #{@message}!"
  end

end
