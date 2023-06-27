class Storage
  def file_read(filename)
    file = File.read(filename)
    JSON.parse(file)
  end

  def file_write(filename, data)
    File.write(filename, JSON.generate(data))
  end
end
