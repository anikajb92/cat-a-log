require_relative 'config/environment'

$process = File_Processor.new
$kitty = "
                 .\": o :\':         ;\': o :\".
                 \`. \`-\' .'.       .\'. \`-\' .'
                   \`---'             \`---'

         _...----...      ...   ...      ...----..._
      .-\'__..-\"\"\'----    \`.  \`x\`  .\'    ----\'\"\"-..__\`-.
     \'.-\'   _.--\"\"\"\'       \`-._.-'       \'\"\"\"--._   \`-.\`
     \'  .-\"\'                  :                  \`\"-.  \`
       \'   \`.      .       _.\'\"\'._       .       .\'   \`
             \`.      \..,.-\'\"       \"\'-.,./     .\'
               \`.                           .\'
                 \`-._                   _.-'
                     \`\"\'--...___...--\'\"\`

"

def prompt
  TTY::Prompt.new
end

def initiate
  system('clear')
  puts '
  WELCOME TO CAT-A-LOG
  '
  puts $kitty
  consent = prompt.yes?('
  This program will create, update, and delete a file in
  the current project folder. Upon completion, you will
  be able to see an activity log.

  Would you like to run this program now?')

  if consent
    $process.run_process
  else
    puts 'Okay. No files will be updated at this time.'
  end
end

initiate
