#!/usr/bin/env ruby
require_relative 'lib/events/event_router'
require_relative 'lib/handlers/console_handler'
require_relative 'lib/handlers/file_handler'
require_relative 'lib/handlers/html_handler'
require_relative 'lib/menu'

# The entry-point wiring
router = EventRouter.new

# Registering output handlers
router.register(ConsoleHandler.new)
router.register(FileHandler.new('lifetrack.log'))
router.register(HtmlHandler.new('dashboard.html'))

# Start the interactive menu
menu = Menu.new(router)
menu.start
