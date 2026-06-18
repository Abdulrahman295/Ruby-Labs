require_relative '../handlers/handler'

class EventRouter
  def initialize
    @handlers = []
  end

  def register(handler)
    # Fail loudly if the registered handler does not implement the Handler interface.
    unless handler.is_a?(Handler)
      raise ArgumentError, "Handler must inherit from Handler interface"
    end
    @handlers << handler
  end

  def dispatch(event)
    # Calls each registered handler simultaneously.
    # The router never references any concrete output class by name.
    @handlers.each do |handler|
      handler.handle(event)
    end
  end
end
