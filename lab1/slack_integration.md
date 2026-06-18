# Adding Slack Notifications: Architectural Answers

### 1. What would you name the new class and where would it live?
I would name the new class `SlackHandler` and it would live in a newly created file at:
`lib/handlers/slack_handler.rb`

### 2. What is the one method it must implement?
It must implement the `handle(event)` method, adhering to the contract defined by the shared `Handler` interface. Inside this method, it would make the HTTP request to the Slack API using the `event` details.

### 3. List every existing file you would open to plug it in.
I would open exactly **one** existing file:
1. `main.rb` (the entry point script)

To wire it up, I would simply add `require_relative 'lib/handlers/slack_handler'` and add one line: `router.register(SlackHandler.new)`. 

