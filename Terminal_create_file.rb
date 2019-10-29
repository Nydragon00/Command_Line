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
        File.write(file, "\n" + data, mode: 'a')
      rescue
        puts "An error has occured."
      end
    end
    if key_word == "append" && mode == "space"
      begin
        data = data.tr("_", " ")
        File.write(file, " " + data, mode: 'a')
      rescue
        puts "An error has occured."
      end
    end
  end
  def count_lines_file(key_word, file)
    if key_word == "count_lines"
      begin
        puts File.foreach(file).count
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
      when "2"
        puts "\nWe got help for 5 elements: \n-create \n-delete \n-close \n-read \n-append\n"
        while true
          print "\nEnter your choice: "
          choice = gets.chomp
          if ["create", "delete", "close", "read", "append"].include?choice
            if choice == "create"
              puts "\nCREATE:
              takes 2 parameters, create and filename with extension
              you want to create, you can aswell specify the directory. If you do not specifiy the directory
              the file will be created in the directory of the program.
              Syntax: [command] [file]
              Example: create G:/test.txt"
            end
            if choice == "delete"
              puts "\nDELETE:
              Do not ask about this option..."
            end
            if choice == "close"
              puts "\nCLOSE:
              takes 2 parameters, close and the filename with extension
              you want to close, you can aswell specify the directory. If you do not specifiy the directory
              the file in the directory of the program will be closed.
              Syntax: [command] [file]
              Example: close G:/test.txt"
            end
            if choice == "read"
              puts "\nREAD:
              takes 2 parameters, read and filename with extension
              you want to read, you can aswell specify the directory. If you do not specifiy the directory
              the file in the directory of the program will be read.
              Syntax: [command] [file]
              Example: read G:/test.txt"
            end
            if choice == "append"
              puts "\nAPPEND:
              takes 4 parameters, append, mode, filename with extension
              you want to append your string to and finally the string you want to append.
              You can aswell specify the directory, if you do not specifiy the directory
              the string will be appended to the file in the directory of the program.
              The modes are nl if you want to create a new line and append your string
              and space if you want to append on the same line. Replace your \" \" with \"_\".
              Syntax: [command] [mode] [file] [input]
              Example: append nl G:/test.txt your_new_string"
            end
          end
          if choice == "end"
            puts "\nEnd has been registrated. You are in the page selection."
            break
          end
        end
      end
      if option == "end"
        puts "\nEnd has been registrated. You are in the control selection."
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
    when "count_lines"
      entry = Handle_file.new
      entry.count_lines_file(command[0], command[1])
    when "man"
      entry = Help.new
      entry.man()
    end
  end
end

core()
#puts Dir["C:/Users/Nydragon/Desktop/*"]
