require 'json'
def read_file(file)
  if File.exist?(file)
    if File.empty?(file)
      []
    else
      file_data = File.read(file)
      JSON.parse(file_data)
    end
  else
    []
  end
end

def write_file(file, content)
  data = content.map(&:to_hash)
  json = JSON.generate(data)
  File.write(file, json)
end
