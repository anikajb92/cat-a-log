class File_Processor
  def run_process
    id = Process.pid
    puts 'Running file processor'
    log_process id
    create_file
    sleep 2 # wait 2 seconds
    modify_file
    sleep 2 # wait 2 more seconds
    delete_file
  end
  # GLOBAL VARIABLES
  $username = `whoami`.chomp! # bash command works here + removing new line
  $absolute_path = File.realdirpath('Cats.txt') # built into Ruby File class
  $log = File.open('Log.json', 'a+')

  def current_time
    time = DateTime.now.strftime('%m-%d-%Y %H:%M:%S')
  end

  # ACTIVITY METHODS
  def create_file
    id = Process.pid
    if File.exist?('Cats.txt')
      puts 'Cats.txt file found...'
    else
      puts 'creating file'
      cat_file = File.open('Cats.txt', 'a+')
      puts 'CREATED Cats.txt'
      log_activity('create_file', id)
    end
  end

  def modify_file
    id = Process.pid
    puts 'modifying file'
    File.write('Cats.txt', "You've got to be kitten me", mode: 'a')
    puts 'MODIFIED Cats.txt'
    log_activity('modify_file', id)
  end

  def delete_file
    id = Process.pid
    puts 'deleting file...'
    File.delete('Cats.txt')
    puts 'DELETED Cats.txt'
    log_activity('delete_file', id)
  end

  # LOG METHODS
  def log_process(id)
    process_info = {
      timestamp: current_time.to_s,
      username: $username.to_s,
      process_name: 'run_process',
      process_id: id
    }
    $log.puts JSON.generate(process_info)
  end

  def log_activity(command, id)
    activity_info = {
      timestamp: current_time.to_s,
      activity_descriptor: command.to_s,
      username: $username.to_s,
      file_path: $absolute_path,
      process_id: id
    }
    $log.puts JSON.generate(activity_info)
    puts "LOGGING #{command}"
  end
end
