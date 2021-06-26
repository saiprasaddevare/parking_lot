require './car'
require './ticket'
require './helpers/parking_lot_helper'
require './helpers/common_helper'
require './helpers/car_helper'

# Parking Lot class
class ParkingLot
  include ParkingLotHelper
  include CommonHelper
  include CarHelper

  def initialize
    @parking_lot_capacity = 0
    @car = Car.new
    @ticket = Ticket.new
  end

  def create_parking_lot
    @parking_lot_capacity = get_user_input('Enter Parking Lot Capacity')
    display_action_details("\n Created Parking Lot with #{@parking_lot_capacity} capacity \n\n")
  end

  def park_a_car
    car_registration_number = get_user_input('Enter Car Registration Number')
    car_color = get_user_input('Enter Car Color')

    @car.add_car(car_registration_number, car_color)
    display_action_details("\n Car Parked in the parking lot \n\n")
    @car.display_car_placed_in_lot
  end
end

parking_lot_instance = ParkingLot.new
parking_lot_instance.queries_list
puts "\n Please Select number for above queries"

until (selected_query = gets.chomp) =~ /(?:ex|qu)it/i
  parking_lot_instance.selected_queries(selected_query.to_i, parking_lot_instance)
end
