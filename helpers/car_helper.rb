require './helpers/common_helper'

# car helper module
module CarHelper
  def registration_number_by_color
    separator_line
    car_color = get_user_input('Provide Car Color Name')
    @car.registration_number_by_color(car_color)
    separator_line
  end

  def car_in_parking_lot
    separator_line
    @car.car_in_parking_lot
    separator_line
  end

  def ticket_number_by_registration_number
    separator_line
    car_registration_number = get_user_input('Provide Car Registration Number')
    @car.ticket_number_by_registration_number(car_registration_number)
    separator_line
  end

  def ticket_number_by_car_color
    separator_line
    car_color = get_user_input('Provide Car Color Name')
    @car.ticket_number_by_car_color(car_color)
    separator_line
  end

  def ticket_number_with_registration_number
    separator_line
    @car.ticket_number_with_registration_number
    separator_line
  end
end
