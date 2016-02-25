class NewBlogFiles

  attr_reader :path, :post_title, :message

  def initialize(path, post_title, message = ["Your content here"])
    @path = path
    @post_title = post_title
    @message = [message].join(" ")
    make_file
  end

  def make_file
    File.write("#{@path}/source/posts/#{@post_title}.markdown", prepopulated_content)
  end

  def prepopulated_content
    "##{@post_title} \n\n #{@message}!"
  end
end
