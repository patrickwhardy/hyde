class NewBlogFiles

  def initialize(path, post_title, message = "Your content here")
    @path = path
    @post_title = post_title
    @message = message
  end

  def make_file
    File.write("#{@path}/#{@post_title}.markdown", prepopulated_content)
  end

  def prepopulated_content
    "##{@post_title} \n\n #{@message}!"
  end

end

# if __FILE__ = $0
new_post = NewBlogFiles.new("/Users/JenniferSoden/", "This_is_a_title")
new_post.make_file
# end
