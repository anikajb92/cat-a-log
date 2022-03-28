class File_Processor
  def run_process
    puts 'Running file processor'
    log_process
    3.times do
      create_file
      sleep 2 # wait 2 seconds
      modify_file
      sleep 2 # wait 2 more seconds
    end
    delete_file
    transmit
  end

  # GLOBAL VARIABLES
  $username = `whoami`.chomp! # works in unix and linux
  $absolute_path = File.realdirpath('Cats.txt')
  $log = File.open('Log.json', 'a+')
  $id = Process.pid
  $command = Process.argv0

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
      # Birthtime capturing the very first creation of file, regardless of how many times the program is run
      birth_time = File.birthtime('Cats.txt').strftime('%m-%d-%Y %H:%M:%S')
      puts 'CREATED Cats.txt'
      log_activity('create_file', birth_time)
    end
  end

  def modify_file
    puts 'modifying file'
    puns = [
      "You've got to be kitten me",
      'This looks fur-miliar',
      "I'm feline good today",
      'This is Paw-sitively the best update ever'
    ]
    File.write('Cats.txt', puns.sample(1), mode: 'a')
    # Ruby method capturing true file modification time rather than method run timestamp
    mod_time = File.mtime('Cats.txt').strftime('%m-%d-%Y %H:%M:%S')
    puts 'MODIFIED Cats.txt'
    log_activity('modify_file', mod_time)
  end

  def delete_file
    time = current_time
    puts 'deleting file...'
    File.delete('Cats.txt')
    puts 'DELETED Cats.txt'
    log_activity('delete_file', time)
  end

  # LOG METHODS
  def log_process
    process_info = {
      Process_Started: {
        timestamp: current_time.to_s,
        username: $username.to_s,
        process_name: 'ruby',
        process_command_line: $command.to_s,
        process_id: $id
      }
    }
    $log.puts JSON.generate(process_info)
  end

  def log_activity(command, time)
    activity_info = {
      Activity_Started: {
        timestamp: time,
        activity_descriptor: command.to_s,
        username: $username.to_s,
        file_path: $absolute_path,
        process_name: 'ruby',
        process_command_line: $command.to_s,
        process_id: $id
      }
    }
    $log.puts JSON.generate(activity_info)
    puts "LOGGING #{command}"
  end

  def log_network
    network_info = {
      Data_Transmitted: {
        timestamp: current_time,
        username: $username.to_s,
        destination: 'http://127.0.0.1:9393/log',
        source: 'localhost:9393',
        amount_of_data: "#{File.size('Log.json')} bytes",
        protocol: 'http/1.1',
        process_name: 'ruby',
        process_command_line: $command.to_s,
        process_id: $id
      }
    }
    $log.puts JSON.generate(network_info)
    puts 'LOGGING Network Data'
  end

  # TRANSMIT DATA
  def transmit
    log_network
    $log.flush
    `shotgun`
  end
end
