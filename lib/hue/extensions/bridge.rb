module Hue
  class Bridge

    def print_state
      state = self.status
      config = state['config']
      puts "#{config['name']}"
      puts "IP: #{config['ipaddress']}"
      puts "Button pressed: #{config['linkbutton']}"
      puts "Applications:"
      config['whitelist'].each do |key, values|
        puts "  #{key} : #{values['name']}"
      end
      puts "Lights:"
      state['lights'].each do |key, values|
        puts "  #{key}. #{values['name']} - #{values['state']['on'] ? 'ON' : 'OFF'}"
      end
    end

  end
end
