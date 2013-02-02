module Hue
  class Bulb

    def print_state
      puts "#{self.name}: #{self.on? ? 'ON' : 'OFF'}"
      puts "Brightness: #{self.brightness} (#{(self.brightness_as_decimal * 100).to_i}%)"
      print "Color: "
      case color_mode
      when 'hs'
        print "Hue=#{self.hue}, Saturation=#{self.saturation}"
      when 'ct'
        print "Temperature=#{self.color_temperature}"
      when 'xy'
        print "XY=#{self.state['xy']}"
      end
      puts ", RGB=[#{self.red}, #{self.green}, #{self.red}]"
      if blinking?
        puts "Alert: Blinking!"
      end
    end

  end
end
