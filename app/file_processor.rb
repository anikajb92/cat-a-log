class File_Processor
  def run_process
    puts 'Running process'
    create_file
    modify_file
    delete_file
  end

  def create_file
    puts 'creating file'
    cat_file = File.open('Cats.txt', 'a+')
    puts 'CREATED Cats.txt'
    log_activity('create_file')
  end

  def modify_file
    puts 'modifying file'
    File.write('Cats.txt', 'Cats are fluffy', mode: 'a')
    puts 'MODIFIED Cats.txt'
  end

  def delete_file
    puts 'deleting file...'
  end

  def log_activity(command)
    activity_info = {
      timestamp: DateTime.now.to_s,
      activity_descriptor: command.to_s
    }
    log = File.open('Log.json', 'a+')
    log.puts JSON.generate(activity_info)
    puts "LOGGING #{command}"
  end
end
