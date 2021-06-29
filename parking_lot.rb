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

  attr_accessor :parking_lot_capacity, :parking_capacity_available

  def initialize
    @parking_capacity_available = 0
    @car = Car.new
  end

  def create_parking_lot
    return puts existing_parking_lot unless @parking_lot_capacity.nil?

    @parking_lot_capacity = @parking_capacity_available = get_user_input('Enter Parking Lot Capacity').to_i
    display_action_details("\n Created Parking Lot with #{@parking_lot_capacity} capacity \n\n")
  end

  def park_a_car
    return puts check_for_parking_lot if @parking_lot_capacity.nil? || @parking_capacity_available.zero?

    car_registration_number = get_user_input('Enter Car Registration Number')
    car_color = get_user_input('Enter Car Color').downcase

    @car.add_car(car_registration_number, car_color)
    display_action_details("\n Car Parked in the parking lot \n\n")
    @parking_capacity_available -= 1
    @car.car_in_parking_lot
  end

  def check_for_parking_lot
    return 'Parking Lot is not created. Please create a Parking Lot' if @parking_lot_capacity.nil?

    return 'Parking Lot is House Full' if @parking_capacity_available.zero?
  end

  def existing_parking_lot
    "Parking Lot is already created with capacity #{@parking_lot_capacity} and avaliable capacity is #{@parking_capacity_available}"
  end
end
