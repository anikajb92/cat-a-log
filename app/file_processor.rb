class File_Processor
  def run_process
    puts 'Running file processor'
    log_process
    create_file
    sleep 2 # wait 2 seconds
    modify_file
    sleep 2 # wait 2 more seconds
    delete_file
  end
  # GLOBAL VARIABLES
  $username = `whoami`.chomp! # bash command works here + removing new line
  $path = `realpath Cats.txt`.chomp! # bash command returns absolute file path
  $log = File.open('Log.json', 'a+')

  def current_time
    time = DateTime.now.strftime('%m-%d-%Y %H:%M:%S')
  end

  # ACTIVITY METHODS
  def create_file
    if File.exist?('Cats.txt')
      puts 'Cats.txt file found...'
    else
      puts 'creating file'
      cat_file = File.open('Cats.txt', 'a+')
      puts 'CREATED Cats.txt'
      log_activity('create_file')
    end
  end

  def modify_file
    puts 'modifying file'
    File.write('Cats.txt', "You've got to be kitten me", mode: 'a')
    puts 'MODIFIED Cats.txt'
    log_activity('modify_file')
  end

  def delete_file
    puts 'deleting file...'
    File.delete('Cats.txt')
    puts 'DELETED Cats.txt'
    log_activity('delete_file')
  end

  # LOG METHODS
  def log_process
    process_info = {
      timestamp: current_time.to_s,
      username: $username.to_s,
      process_name: 'run_process'
    }
    $log.puts JSON.generate(process_info)
  end

  def log_activity(command)
    activity_info = {
      timestamp: current_time.to_s,
      activity_descriptor: command.to_s,
      username: $username.to_s,
      file_path: $path
    }
    $log.puts JSON.generate(activity_info)
    puts "LOGGING #{command}"
  end
end
