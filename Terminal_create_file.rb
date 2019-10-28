class Handle_file
  def create_file(key_word, file)
    begin
      if key_word == "create" && !File.file?(file)
        File.new(file, File::CREAT)
      elsif File.file?(file) == true
        puts "file exists"
      end
    rescue
      puts "An error has occured"
    end
  end
  def delete_file(key_word, file)
    f = File.open(file)
    if key_word == "delete" && File.file?(file)
      begin
        File.delete(f)
      rescue
        puts "An error has occured"
      end
    end
  end
  def close_file(key_word, file)
    f = File.open(file)
    if key_word == "close"
      begin
        f.close
      rescue
        puts "An error has occured"
      end
    end
  end
  def read_file(key_word, file)
    if key_word == "read"
      begin
        f = File.open(file)
        f = f.read
        puts f
      rescue
        puts "An error has occured"
      end
    end
  end
  def append_file(key_word, mode, file, data)
    if key_word == "append" && mode == "nl"
      begin
        data = data.tr("_", " ")
        File.write(file, data + "\n ", mode: 'a')
      rescue
        puts "An error has occured"
      end
    end
    if key_word == "append" && mode == "space"
      begin
        data = data.tr("_", " ")
        File.write(file, data + " ", mode: 'a')
      rescue
        puts "An error has occured"
      end
    end
  end
end

class Help
  def man()

    puts "\nWich page do you want to open? " #add the different topics
    while true
      option = gets.chomp
      case option
      when "1"
        puts "\nWe got help to 5 elements: \ncreate \ndelete \nclose \nread \nappend\n\n"
        while true
          choice = gets.chomp
          if ["create", "delete", "close", "read", "append"].include?choice
            if choice == "create"
              puts "create is:"
            end
          end
          if choice == "end"
            puts "End has been registrated"
            break
          end
        end
      end
      if option == "end"
        puts "End has been registrated"
        break
      end
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
  if command[0] == "read"
    entry = Handle_file.new
    entry.read_file(command[0], command[1])
  end
  if command[0] == "append"
    entry = Handle_file.new
    entry.append_file(command[0], command[1], command[2], command[3])
  end
  if command[0] == "man"
    entry = Help.new
    entry.man()
  end
end
