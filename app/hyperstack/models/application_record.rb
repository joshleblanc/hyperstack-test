module Hyperstack
    class Hotloader
        def connect_to_websocket(port)
        host = '25222-fc613f80-6767-4b24-8269-fd688e5c335f.ws-us0.gitpod.io/'
        protocol = `window.location.protocol` == 'https:' ? 'wss:' : 'ws:'
        ws_url = "#{host}"
        puts "Hot-Reloader connecting to #{ws_url}"
        ws = `new WebSocket(#{protocol} + '//' + #{ws_url})`
        `#{ws}.onmessage = #{lambda { |e| reload(e) }}`
        `setInterval(function() { #{ws}.send('') }, #{@ping * 1000})` if @ping
        end
    end
end

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  regulate_scope all: true
end
