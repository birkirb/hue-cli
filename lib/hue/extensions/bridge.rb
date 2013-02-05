module Hue
  class Bridge

    def print_state
      state = self.status
      config = state['config']
      puts "#{config['name']}"
      puts "Button pressed: #{config['linkbutton']}"
      puts "Timestamp: #{config['UTC']}"
      puts "Network configuration:"
      puts "  IP:      #{config['ipaddress']}"
      puts "  Gateway: #{config['gateway']}"
      puts "  Mask:    #{config['netmask']}"
      puts "  DHCP:    #{config['dhcp']}"
      puts "  MAC:     #{config['mac']}"
      if !config['proxyaddress'].strip.empty?
        puts "  Proxy:   #{config['proxyaddress']}:#{config['proxyport']}"
      end
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
