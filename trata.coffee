ops = require 'optimist'
commandName = ops.argv._[0]

trata = require 'trata-juice'

commands =
	init: () ->
		trata.init(() ->)
		console.log "Created pomodoro.txt"
	help: () -> 
		showUsage()

showUsage = () ->
	console.log "Commands: " + (commandName for commandName, command of commands).join ', '

command = commands[commandName] || () ->
	console.log "Missing command name"
	commands['help']()
	

command()
