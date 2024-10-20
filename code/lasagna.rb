# frozen_string_literal: true

class Lasagna
  EXPECTED_MINUTES_IN_OVEN = 40

  def remaining_minutes_in_oven(actual_minutes_in_oven)
    EXPECTED_MINUTES_IN_OVEN - actual_minutes_in_oven
  end

  def preparation_time_in_minutes(layers)
    num_minutes = 2
    layers * num_minutes
  end

  def total_time_in_minutes(number_of_layers:, actual_minutes_in_oven:)
    preparation_time_in_minutes(number_of_layers) + actual_minutes_in_oven
  end
end

if __FILE__ == $0
  lasgna = Lasagna.new
  puts "Remaining minutes in oven: #{lasgna.remaining_minutes_in_oven(30)}"
  puts "Preparation Time: #{lasgna.preparation_time_in_minutes(2)}"
  puts "Total Time spent: #{lasgna.total_time_in_minutes(number_of_layers: 3, actual_minutes_in_oven: 20)}"
end
