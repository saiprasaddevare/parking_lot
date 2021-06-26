require './helpers/common_helper'
require './ticket'

# Car Class for holding car details
class Car
  include CommonHelper

  def initialize()
    @car_details = []
  end

  def add_car(registration_number, color)
    ticket = Ticket.new
    @car_details.push({ 'registration_number': registration_number,
                        'color': color,
                        'ticket': ticket })
  end

  def car_in_parking_lot
    return puts 'No cars in parking lot' if @car_details.empty?

    puts "Registration Number \t\t\t Color"
    @car_details.each do |car_details|
      puts "#{car_details[:registration_number]} \t\t\t\t #{car_details[:color]}"
    end
  end

  def registration_number_by_color(color)
    separator_line
    cars_by_color = @car_details.select { |car_detail| car_detail[:color] == color }
    return puts "No Car With Color #{color} found in parking lot" if cars_by_color.empty?

    puts "Registration Number of cars with color #{color}"
    cars_by_color.each do |car_by_color|
      puts car_by_color[:registration_number]
    end
  end
end
