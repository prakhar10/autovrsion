# Autovrsion

A command line tool for simple auto versioning of files using Rugged and Listen.

## Installation

Add this line to your application's Gemfile:

    gem 'autovrsion'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install autovrsion

## Pre-requisities
install Git:
command: $ sudo apt-get install git
install Ruby:
links for downloading and installing ruby 
https://www.ruby-lang.org/en/downloads/
https://www.ruby-lang.org/en/installation/

## Usage
	$ autovrsion <option>
	for working on current directory

	$ autovrsion <option> </path/to/your/directory>
	for working on a specific directory

	options:-
		1.create - used to create a new git repository or re-initialize an existing one.
		2.start - start listening to file system changes and auto commit any change.commits would be created after every file addition,modification and/or deletion.
		4.display - display the versions in the repository.
		5.check - access a particular version.
		6.reset - used after the check command,it resets to the latest version in the repository.
		7.rewind - permanently rewind to a previous version(WARNING! any changes after the rewound version are permanently lost)

### Command Usage

$ autovrsion create
or
$ autovrsion create /path/to/repository

$ autovrsion start 
or
$ autovrsion start /path/to/repository

$ autovrsion display
or
$ autovrsion display /path/to/repository

$ autovrsion check
or
$ autovrsion check /path/to/repository 

$ autovrsion reset
or
$ autovrsion reset /path/to/repository

$ autovrsion rewind
or
$ autovrsion rewind /path/to/repository

