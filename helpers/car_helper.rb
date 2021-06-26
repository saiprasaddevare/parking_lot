require './helpers/common_helper'

# car helper module
module CarHelper
  def registration_number_by_color
    separator_line
    car_color = get_user_input('Provide Car Color Name')
    @car.registration_number_by_color(car_color)
    separator_line
  end
end
