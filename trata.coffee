ops = require 'optimist'
args = ops.argv._
commandName = args[0]

trata = require 'trata-juice'

commands =
	init: () ->
		trata.init (err) ->
			if err
				console.log "Error while initializing pomodoro.txt: " + err
			else
				console.log "Created pomodoro.txt"
	help: () -> 
		showUsage()

showUsage = () ->
	console.log "Commands: " + (commandName for commandName, command of commands).join ', '

command = commands[commandName] || () ->
	console.log "Missing command name"
	commands['help']()
	

command()
