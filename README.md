# CAT-A-LOG

Malware is a constantly evolving threat. This means detection and response agents need to be proactive and accurate...so how do we ensure these protective softwares are working properly?
<br/>
That's where Cat-A-Log comes in! Cat-A-Log is an application that offers comparative test data for EDR software...with a fun twist. 
<br/>
Paw-don the puns; this self-induced file manipulation and transmission software is making hiss-tory. 

## How it works -

Running this project will trigger a short lifecycle of a file and send a log of the activities' details to your browser:
1. Creates a Cats.txt file in the application
2. Updates this file with paw-some puns
3. Deletes the file and remove it from the directory
<br/>
As each of these actions are executed, an entry with detailed data is added to the log, (e.g. timestamps, name of the user who initiated the process, etc.). This log acts as core telemetry to be compared against a sensor's log of data. If the entries don't match, the sensor needs to be updated.

## Installation

Compatible with Unix (MacOS) and Linux. 
This application utilizes several ruby [gems](Gemfile). To run the program on your device clone the repository, change directories into the project folder, and install the dependencies. 

```bash
bundle install
```

To get the app started, run the following command in your terminal:

```bash
ruby runner.rb
```

This will prompt you to confirm you'd like the program to run it's the process in full. 

```
Would you like to run this program now? (Y/n) 
```
Typing ```Y``` or ```Yes``` will launch the program. Once the program has completed its tasks, a log will be available for viewing online. Open your web browser and go to:

```http
http://127.0.0.1:9393/log
```

## Tech Stack
This is a Ruby application with [Rack middleware](https://guides.rubyonrails.org/rails_on_rack.html). Ruby gems include: JSON and TTY:Prompt.

## Future 

If I were to expand this app, I would implement the following:
1. More dynamic variables: methods to accept arguments and values from the device, rather than hard-coded params. 
2. A frontend with a simple "Start" button that would run the program and return the log as a downloadable file.
3. An internal server call that would send the log.json file without requiring a request from the browser
4. Run several different types of modifications to the test file