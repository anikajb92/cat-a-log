class File_Processor
  def run_process
    puts 'Running file processor'
    log_process
    create_file
    modify_file
    delete_file
  end
  # GLOBAL VARIABLES
  $cat_file = File.open('Cats.txt', 'a+')
  $log = File.open('Log.json', 'a+')

  def current_time
    time = DateTime.now.strftime('%m-%d-%Y %H:%M:%S')
  end

  # ACTIVITY METHODS
  def create_file
    puts 'creating file'
    $cat_file
    puts 'CREATED Cats.txt'
    log_activity('create_file')
  end

  def modify_file
    puts 'modifying file'
    $cat_file.puts 'Cats are fluffy'
    puts 'MODIFIED Cats.txt'
  end

  def delete_file
    puts 'deleting file...'
  end

  # LOG METHODS
  def log_process
    process_info = {
      timestamp: current_time.to_s,
      process_name: 'run_process'
    }
    $log.puts JSON.generate(process_info)
  end

  def log_activity(command)
    activity_info = {
      timestamp: current_time.to_s,
      activity_descriptor: command.to_s
    }
    $log.puts JSON.generate(activity_info)
    puts "LOGGING #{command}"
  end
end
