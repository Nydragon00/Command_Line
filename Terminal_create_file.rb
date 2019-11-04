require "fileutils"



class Handle_file

  def initialize(file_param)
    @file = file_param
  end

  def create_file(key_word)
    begin
      if key_word == "create" && !File.file?(@file)
        File.new(@file, File::CREAT)
      elsif File.file?(@file) == true
        puts "\nFile exists."
      end
    rescue
      puts "An error has occured."
    end
  end
  def delete_file(key_word) #does not work
    if key_word == "delete"
      begin
        f = File.close(@file)
        File.delete(f)
      rescue
        puts "An error has occured."
      end
    end
  end
  def close_file(key_word)
    f = File.open(@file)
    if key_word == "close"
      begin
        f.close
      rescue
        puts "An error has occured."
      end
    end
  end
  def read_file(key_word)
    if key_word == "read"
      begin
        f = File.open(@file)
        line_num=0
        File.open(@file).each do |line|
          print "#{line_num += 1} #{line.chomp} \n"
        end
      rescue
        puts "An error has occured"
      end
    end
  end
  def append_file(key_word, mode, data)
    if key_word == "append" && mode == "nl"
      begin
        data = data.tr("_", " ")
        File.write(@file, "\n" + data, mode: 'a')
      rescue
        puts "An error has occured."
      end
    end
    if key_word == "append" && mode == "space"
      begin
        data = data.tr("_", " ")
        File.write(@file, data + " ", mode: 'a')
      rescue
        puts "An error has occured."
      end
    end
  end
  def count_lines_file(key_word)
    if key_word == "count_lines"
      begin
        puts File.foreach(@file).count
      rescue
        puts "An error has occured."
      end
    end
  end
  def rename_file(key_word, new_name)
    if key_word == "rename"
      begin
        File.rename(@file, new_name)
      rescue
        puts "An error has occured."
      end
    end
  end
  def open_file(key_word)
    if key_word == "open"
      begin
        File.open(@file)
      rescue
        puts "An error has occured."
      end
    end
  end
  def check_status_file(key_word)
    if key_word == "check_status"
      if File.exists?(@file) == true
        bytes = File.size(@file)
        birthtime = File.birthtime(@file)
        print "\n[#{@file}] exists "
        print "and is [#{bytes}] bytes large.\n"
        print "The date of creation of [#{@file}] is [#{birthtime}].\n"
      else
        puts "File is closed."
      end
    end
  end
  def move_file(key_word, destination)
    if key_word == "move"
      begin
        FileUtils.move(@file, destination)
      rescue
        puts "An error has occured."
      end
    end
  end
end

class Parse
  def path(key_word)
    if key_word == "path"
      puts Dir.pwd
    end
  end
  def goto(key_word, path)
    if key_word == "goto"
      puts Dir[path]
    end
  end
  def search(key_word, start, file)
      puts Dir[start.tr("\\", "/") + "**/" + file.tr("\\", "/")]
  end
end

class Help
  def man()
    while true
      print "\nWich page do you want to open: \n1. parsing \n2. handling \n" #add the different topics
      print "\nEnter your choice: "
      option = gets.chomp
      case option
      when "1"
        puts "\nWe got help for these elements: \n1. path \n2. goto"
        while true
          print "\nEnter your choice: "
          choice = gets.chomp
          if ["1", "2"].include?choice
            if choice == "1"
                puts "\nPATH:
              takes 1 paramenter, the file name.
              Shows the path of this file, no more, no less.
              Syntax: [command]
              Example: path"
            end
            if choice == "2"
              puts "\nGOTO:
              takes 2 parameters, goto and the path. You can inspect other directories
              and see the files thew contain. Use an absolute path if possible or
              stay in the branch of this file.
              to parse it with a relative path.
              Syntax: [command] [path]
              Example: goto G:/"
            end
          end
          if choice == "end"
            puts "\nEnd has been registrated. You are in the page selection."
            break
          end
        end
      when "2"
        puts "\nWe got help for these elements: \n1. create \n2. delete \n3. close \n4. read \n5. append \n6. count lines \n7. rename \n8. open \n9. check status"
        while true
          print "\nEnter your choice: "
          choice = gets.chomp
          if ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"].include?choice
            if choice == "1"
              puts "\nCREATE:
              takes 2 parameters, create and filename with extension
              you want to create, you can aswell specify the directory. If you do not specifiy the directory
              the file will be created in the directory of the program.
              Syntax: [command] [file]
              Example: create G:/test.txt"
            end
            if choice == "2"
              puts "\nDELETE:
              Do not ask about this option..."
            end
            if choice == "3"
              puts "\nCLOSE:
              takes 2 parameters, close and the filename with extension
              you want to close, you can aswell specify the directory. If you do not specifiy the directory
              the file in the directory of the program will be closed.
              Syntax: [command] [file]
              Example: close G:/test.txt"
            end
            if choice == "4"
              puts "\nREAD:
              takes 2 parameters, read and filename with extension
              you want to read, you can aswell specify the directory. If you do not specifiy the directory
              the file in the directory of the program will be read. Each line will have the coresponding
              line count at the beginning of the line.
              Syntax: [command] [file]
              Example: read G:/test.txt"
            end
            if choice == "5"
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
            if choice == "6"
              puts "\nCOUNT LINES:
              takes 2 parameters, count_lines and the filename with extension.
              You can aswell specify the directory, if you do not specifiy the directory
              the file in the folder of the source code will be used.
              Syntax: [command] [file]
              Example: count_lines G:/test.txt"
            end
            if choice == "7"
              puts "\nRENAME:
              takes 3 parameters, rename, the file name with extension and the new name
              of this file with extension. You can aswell specify the directory, if you
              do not specifiy the directory the file in the folder of the source code will be renamed.
              Syntax: [command] [file] [new]
              Example: rename toto.txt test.rb"
            end
            if choice == "8"
              puts "\nOPEN:
              takes 2 parameters, open and the file name with extension. You can specifiy the
              file path if wou want to open a file in another directory.
              Syntax: [command] [file]
              Example: open G:/test.txt"
            end
            if choice == "9"
              puts "\nCHECK_STATUS:
              takes 2 parameters, check_status and the file name with extension. You can specify
              the file path if u want to open a file in another directory. This command prints if the
              file exists, its size and date of creation (may add it's open/closed status).
              Syntax: [command] [file]
              Example: check_status G:/test.txt"
            end
            if choice == "10"
              puts "\nMOVE:
              takes 3 parameters, move, the file & extension wou want to move and its target location.
              Note: if you want to move the file to another branch, then you need the absolute
              location. The target location has to be a directory, otherwise it will cause an error.
              Syntax: [command] [file] [target location]
              Example: move G:/test.txt C:/example_target"
            end
          end
          if choice == "end"
            puts "\nEnd has been registered. You are in the page selection."
            break
          end
        end
      end
      if option == "end"
        puts "\nEnd has been registered. You are in the control selection."
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
      entry = Handle_file.new(command[1])
      entry.create_file(command[0])
    when "delete"
      entry = Handle_file.new(command[1])
      entry.delete_file(command[0])
    when "close"
      entry = Handle_file.new(command[1])
      entry.close_file(command[0])
    when "read"
      entry = Handle_file.new(command[1])
      entry.read_file(command[0])
    when "append"
      entry = Handle_file.new(command[1])
      entry.append_file(command[0], command[2], command[3])
    when "count_lines"
      entry = Handle_file.new(command[1])
      entry.count_lines_file(command[0])
    when "rename"
      entry = Handle_file.new(command[1])
      entry.rename_file(command[0], command[2])
    when "open"
      entry = Handle_file.new(command[1])
      entry.open_file(command[0])
    when "check_status"
      entry = Handle_file.new(command[1])
      entry.check_status_file(command[0])
    when "move"
      entry = Handle_file.new(command[1])
      entry.move_file(command[0], command[2])
    when "path"
      entry = Parse.new
      entry.path(command[0])
    when "goto"
      entry = Parse.new
      entry.goto(command[0], command[1])
    when "search"
      entry = Parse.new
      entry.search(command[0], command[1], command[2])
    when "man"
      entry = Help.new
      entry.man()
    end
  end
end

core()
