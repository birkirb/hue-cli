module Hue
  class Bulb

    def print_state
      puts "#{self.name}: #{self.on? ? 'ON' : 'OFF'}"
      puts "Brightness: #{self.brightness} (#{(self.brightness_percent).to_i}%)"
      print "Color: "
      print self.color.to_s
      puts ", #{self.color.to_rgb.to_s}"
      if blinking?
        puts "Alert: Blinking!"
      end
    end

  end
end
