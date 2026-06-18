class Handler
  # The shared interface for all outputs.
  # Enforces its contract at runtime.
  def handle(event)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
