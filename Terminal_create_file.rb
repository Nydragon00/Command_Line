class Handle_file
  def create_file(key_word, file)
    if key_word == "create" && !File.file?(file)
      File.new(file, File::CREAT)
    elsif File.file?(file) == true
      puts "file exists"
    end
  end
  def delete_file(key_word, file)
    f = File.open(file)
    if key_word == "delete" && File.file?(file)
      File.delete(f)
    end
  end
  def close_file(key_word, file)
    f = File.open(file)
    if key_word == "close"
      f.close
    end
  end
end

command = "empty"

while true
  print "Enter the command: "
  command = gets.chomp
  command = command.split(' ')
  if command[0] == "end"
    break
  end
  if command[0] == "create"
    entry = Handle_file.new
    entry.create_file(command[0], command[1])
  end
  if command[0] == "delete"
    entry = Handle_file.new
    entry.delete_file(command[0], command[1])
  end
  if command[0] == "close"
    entry = Handle_file.new
    entry.close_file(command[0], command[1])
  end
end
