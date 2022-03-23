class File_Processor
  def run_process
    puts 'Running process'
    create_file
    modify_file
    delete_file
  end

  def create_file
    puts 'creating file'
  end

  def modify_file
    puts 'modifying file'
  end

  def delete_file
    puts 'deleting file'
  end
end
