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
             \`.      \..,.-\'\"       \"\'-.,./       .\'
               \`.                           .\'
                 \`-._                   _.-'
                     \`\"\'--...___...--\'\"\`

"

def prompt
  TTY::Prompt.new
end

def initiate
  system('clear')
  puts 'Welcome to Cat-A-Log'
  puts $kitty
  consent = prompt.yes?('Would you like to run this program now?')

  if consent
    $process.run_process
  else
    puts 'Okay. No files will be updated at this time.'
  end
end

initiate
