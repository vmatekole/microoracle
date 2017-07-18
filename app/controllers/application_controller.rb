class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def connect
    p 'Connecting to Bigchaindb service'
    EM.run {
      url   = Rails.configuration.bigchaindb_ws_url
      p url
      ws = Faye::WebSocket::Client.new(url, [],
                                       :headers    => {'Origin' => 'http://faye.jcoglan.com'}
      )

      ws.onclose = lambda do |close|
        p [:close, close.code, close.reason]
        EM.stop
      end

      ws.onerror = lambda do |error|
        p [:error, error.message]
      end

      ws.onmessage = lambda do |message|
        p [:message, message.data]
      end
    }
  end
end
