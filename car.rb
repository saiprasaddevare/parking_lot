require './helpers/common_helper'
require './ticket'

# Car Class for holding car details
class Car
  include CommonHelper

  attr_accessor :car_details

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

    puts "All Cars in Parking Lot \n"
    puts "Registration Number \t\t\t Color"
    @car_details.each do |car_details|
      puts "#{car_details[:registration_number]} \t\t\t\t #{car_details[:color]}"
    end
  end

  def registration_number_by_color(color)
    separator_line
    cars_by_color = get_car_by_color(color)
    return puts "No Car With Color #{color} found in parking lot" if cars_by_color.empty?

    puts "Registration Number of cars with color #{color}"
    cars_by_color.each do |car_by_color|
      puts car_by_color[:registration_number]
    end
  end

  def ticket_number_by_registration_number(registration_number)
    separator_line
    cars_by_registration_number = @car_details.select { |car_detail| car_detail[:registration_number] == registration_number }
    return puts "No Car With Registration Number #{registration_number} found in parking lot" \
    if cars_by_registration_number.empty?

    puts "Ticket Numbers of car with registration number #{registration_number}\n"
    cars_by_registration_number.each do |car_by_registration_number|
      puts car_by_registration_number[:ticket].ticket_number
    end
  end

  def ticket_number_by_car_color(color)
    separator_line
    cars_by_color = get_car_by_color(color)
    return puts "No Car With Color #{color} found in parking lot" if cars_by_color.empty?

    puts "Ticket Number of cars with color #{color}"
    cars_by_color.each do |car_by_color|
      puts car_by_color[:ticket].ticket_number
    end
  end

  def get_car_by_color(color)
    @car_details.select { |car_detail| car_detail[:color] == color }
  end

  def ticket_number_with_registration_number
    return puts 'No cars in parking lot' if @car_details.empty?

    puts "Ticket Number \t\t\t Registration Number"
    @car_details.each do |car_details|
      puts "#{car_details[:ticket].ticket_number} \t\t\t #{car_details[:registration_number]}"
    end
  end
end
