class Handle_file
  def create_file(key_word, file)
    begin
      if key_word == "create" && !File.file?(file)
        File.new(file, File::CREAT)
      elsif File.file?(file) == true
        puts "\nFile exists."
      end
    rescue
      puts "An error has occured."
    end
  end
  def delete_file(key_word, file)
    if key_word == "delete" && File.file?(file)
      begin
        f = File.open(file)
        File.delete(f)
      rescue
        puts "An error has occured."
      end
    end
  end
  def close_file(key_word, file)
    f = File.open(file)
    if key_word == "close"
      begin
        f.close
      rescue
        puts "An error has occured."
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
        puts "An error has occured."
      end
    end
    if key_word == "append" && mode == "space"
      begin
        data = data.tr("_", " ")
        File.write(file, data + " ", mode: 'a')
      rescue
        puts "An error has occured."
      end
    end
  end
end

class Help
  def man()
    while true
      print "\nWich page do you want to open: " #add the different topics
      option = gets.chomp
      case option
      when "1"
        puts "\nWe got help for 5 elements: \n-create \n-delete \n-close \n-read \n-append\n"
        while true
          print "\nEnter your choice: "
          choice = gets.chomp
          if ["create", "delete", "close", "read", "append"].include?choice
            if choice == "create"
              puts "\ncreate is:"
            end
            if choice == "delete"
              puts "\ndelete is:"
            end
            if choice == "close"
              puts "\nclose is:"
            end
            if choice == "read"
              puts "\nread is:"
            end
            if choice == "append"
              puts "\nappend is:"
            end
          end
          if choice == "end"
            puts "\nEnd has been registrated."
            break
          end
        end
      end
      if option == "end"
        puts "\nEnd has been registrated."
        break
      end
    end
  end
end

def core
  command = "empty"
  while true
    print "\nEnter the command: "
    command = gets.chomp
    command = command.split(' ')
    case command[0]
    when "end"
      puts "\nEnd has been registrated."
      break
    when "create"
      entry = Handle_file.new
      entry.create_file(command[0], command[1])
    when "delete"
      entry = Handle_file.new
      entry.delete_file(command[0], command[1])
    when "close"
      entry = Handle_file.new
      entry.close_file(command[0], command[1])
    when "read"
      entry = Handle_file.new
      entry.read_file(command[0], command[1])
    when "append"
      entry = Handle_file.new
      entry.append_file(command[0], command[1], command[2], command[3])
    end
    if command[0] == "man"
      entry = Help.new
      entry.man()
    end
  end
end

core()
