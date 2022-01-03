require_relative '../../utilities/indentation'

module Hue
  class Bulb
    include Indentation

    def print_state
      spaces = 4
      puts "#{self.id}.".ljust(spaces) + "#{self.name}: #{self.on? ? 'ON' : 'OFF'}"
      indent(spaces) do
        puts "Brightness: #{self.brightness} (#{(self.brightness_percent).to_i}%)" if self.brightness
        puts "Color: #{self.color}, #{self.color.to_rgb}" if self.state["hue"]
        transitory_state = [
          (self.transition_time > 0 ? "Transition time: #{self.transition_time} sec" : nil),
          (self.blinking? ? 'Alert: Blinking!' : nil),
          (self.effect? ? "Effect: #{self.effect}" : nil),
        ].compact
        puts transitory_state.join(", ") unless transitory_state.empty?
      end
    end

  end
end
