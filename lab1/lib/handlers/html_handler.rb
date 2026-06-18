require_relative 'handler'

class HtmlHandler < Handler
  def initialize(filepath)
    @filepath = filepath
    @events = []
  end

  def handle(event)
    @events << event
    regenerate_dashboard
  end

  private

  def regenerate_dashboard
    html = <<~HTML
      <!DOCTYPE html>
      <html lang="en">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LifeTrack Dashboard</title>
        <style>
          body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin: 2rem; background: #f4f4f9; color: #333; }
          .container { max-width: 800px; margin: 0 auto; }
          .event-card { background: white; padding: 1.5rem; margin-bottom: 1rem; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
          .event-header { display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #eee; padding-bottom: 0.5rem; margin-bottom: 1rem; }
          .type { font-weight: bold; text-transform: uppercase; letter-spacing: 1px; color: #0056b3; }
          .time { color: #888; font-size: 0.9em; }
          .desc { font-size: 1.1em; }
          .duration { display: inline-block; background: #e9ecef; padding: 0.2rem 0.6rem; border-radius: 12px; font-size: 0.85em; margin-top: 0.5rem; }
        </style>
      </head>
      <body>
        <div class="container">
          <h1>LifeTrack Dashboard</h1>
          #{events_html}
        </div>
      </body>
      </html>
    HTML

    File.write(@filepath, html)
  end

  def events_html
    @events.map do |event|
      <<~HTML
        <div class="event-card">
          <div class="event-header">
            <span class="type">#{event.type}</span>
            <span class="time">#{event.formatted_time}</span>
          </div>
          <div class="desc">#{event.description}</div>
          <div class="duration">⏱ #{event.duration} min</div>
        </div>
      HTML
    end.join("\n")
  end
end
