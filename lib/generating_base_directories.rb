class GeneratingBaseDirectories

  def make_directory(directory_name)
    `mkdir #{directory_name.to_s}'`

end
