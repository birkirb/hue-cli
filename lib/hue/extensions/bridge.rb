module Hue
  class Bridge
    include Indentation

    def print_config
      puts "Config:"
      indent do
        puts "Application id: #{application_id}"
        puts "Bridge URI: #{bridge_uri}"
      end
    end

    def print_state
      state = self.status
      config = state['config']
      puts "#{config['name']}"
      puts "Button pressed: #{config['linkbutton']}"
      puts "Timestamp: #{config['UTC']}"
      puts "Network configuration:"
      indent do
        puts "IP:      #{config['ipaddress']}"
        puts "Gateway: #{config['gateway']}"
        puts "Mask:    #{config['netmask']}"
        puts "DHCP:    #{config['dhcp']}"
        puts "MAC:     #{config['mac']}"
        if !config['proxyaddress'].strip.empty?
          puts "Proxy:   #{config['proxyaddress']}:#{config['proxyport']}"
        end
      end

      puts "Applications:"
      indent do
        config['whitelist'].each do |key, values|
          puts "#{key} : #{values['name']}"
        end
      end

      puts "Lights:"
      indent do
        state['lights'].each do |key, values|
          puts "  #{key}. #{values['name']} - #{values['state']['on'] ? 'ON' : 'OFF'}"
        end
      end
    end

    def print_bulbs
      self.bulbs.each do |bulb|
        bulb.print_state
      end
    end

  end
end
